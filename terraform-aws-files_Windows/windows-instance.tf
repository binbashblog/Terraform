resource "aws_instance" "terraform-Windows" {
  ami 			= "${lookup(var.WIN_AMIS, var.aws_region)}"
  instance_type 	= "t2.micro"
  key_name 		= "${aws_key_pair.mykey.key_name}"
  security_groups 	= ["${aws_security_group.allow_rdp_winrm.name}"]
  user_data = <<EOF
<powershell>
net user ${var.INSTANCE_USERNAME} '${var.INSTANCE_PASSWORD}' /add /y
net localgroup administrators ${var.INSTANCE_USERNAME} /add

winrm quickconfig -q
winrm set winrm/config/winrs '@{MaxMemoryPerShellMB="300"}'
winrm set winrm/config '@{MaxTimeoutms="1800000"}'
winrm set winrm/config/service '@{AllowUnencrypted="true"}'
winrm set winrm/config/service/auth '@{Basic="true"}'

netsh advfirewall firewall add rule name="WinRM 5985" protocol=TCP dir=in localport=5985 action=allow
netsh advfirewall firewall add rule name="WinRM 5986" protocol=TCP dir=in localport=5986 action=allow

net stop winrm
sc.exe config winrm start=auto
net start winrm
</powershell>
EOF

  provisioner "file" {
    source 		= "test.txt"
    destination 	= "C:/test.txt"
  }
  connection {
    host 		= "${self.public_ip}" # terraform has recently made a change in the windows provider that requires this 
    timeout 		= "10m"
    type 		= "winrm"
    user 		= "${var.INSTANCE_USERNAME}"
    password 		= "${var.INSTANCE_PASSWORD}"
  }
}

resource "aws_security_group" "allow_rdp_winrm" {
  name			= "allow_rdp_winrm"
  description		= "Allow rdp and winrm traffic"

  ingress {
    from_port		= 3389
    to_port             = 3389
    protocol            = "tcp"

    cidr_blocks         = ["0.0.0.0/0"]  # this should be changed to something secure
  }
  ingress {
    from_port           = 5985
    to_port             = 5986
    protocol            = "tcp"

    cidr_blocks         = ["0.0.0.0/0"]  # this should be changed to something secure
  }
}

resource "aws_key_pair" "mykey" {
  key_name              = "mykey"
  public_key            = "${file("${var.PATH_TO_PUBLIC_KEY}")}"
}
