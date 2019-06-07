resource "aws_instance" "binbashblog_ec2_instance" {
  ami           	= "ami-2757f631"
  availability_zone	= "${var.availability_zone}"
  instance_type 	= "${var.instance_type}"

  tags {
    Name = "binbashblog-EC2-instance-web"
  }
}

resource "aws_ebs_volume" "binbashblog_ebs_volume" {
 availability_zone = "${var.availability_zone}"
 size		   = 1

 tags {
   Name = "binbashblog-EBS-volume"
  }
}

resource "aws_volume_attachment" "binbashblog_vol_attachment" {
 device_name = "/dev/sde"
 volume_id   = "${aws_ebs_volume.binbashblog_ebs_volume.id}"
 instance_id = "${aws_instance.binbashblog_ec2_instance.id}"
}
