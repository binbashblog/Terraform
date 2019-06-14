resource "google_compute_instance" "tf-gc-windows" {
  name			= "tf-gc-windows"
  zone         		= "${var.zone}"
  machine_type 		= "${var.machine_type}"

  allow_stopping_for_update = true

  boot_disk {
    auto_delete = "true"

    initialize_params {
      image = "windows-cloud/windows-2016"
      size  = "${var.boot_disk_size_size}"
      type  = "${var.boot_disk_size_type}"
    }
  }


  network_interface {
     network    = "default"
     access_config {}
     #address       = ""
  }


    metadata = { 
      sysprep-specialize-script-ps1 = <<EOF
Start-Transcript -Path "${var.install_files_path}\bootstrap-windows-startup.log" -Append
New-NetFirewallRule -DisplayName 'RDP Port 3389' -Direction Inbound -LocalPort 3389 -Protocol TCP -Action Allow
New-NetFirewallRule -DisplayName 'WinRM' -Direction Inbound -LocalPort 5985 -Protocol TCP -Action Allow

do {
    Start-Sleep -Seconds 20
    Enable-PSRemoting -Force 
    Set-Item "wsman:\localhost\client\trustedhosts" -Value '*' -Force
    winrm set winrm/config/service/auth '@{Basic="true"}'  
    winrm set winrm/config/service '@{AllowUnencrypted="true"}'
    winrm set winrm/config/winrs '@{MaxMemoryPerShellMB="1024"}'
    
    $winrm_cfg=[xml](winrm get winrm/config/service -format:xml)
    $winrm_cfg.Service
    $winrm_cfg.Service.Auth
} While( ($winrm_cfg.Service.AllowUnencrypted -eq "false") -or ($winrm_cfg.Service.Auth.Basic -eq "false") )
EOF

 }

  connection {
    host     = "$(address)}" # terraform has recently made a change in the windows provider that requires this in v0.12
    type     = "winrm"
    user     = "${var.INSTANCE_USERNAME}"
    password = "${var.INSTANCE_PASSWORD}" 
//  password = "${random_string.admin_password.result}"
    timeout  = "${var.winrm_timeout}"
    https    = "false"
    insecure = "true"
  }


  provisioner "file" {
    source 		= "test.txt"
    destination 	= "C:/test.txt"
  }
}
