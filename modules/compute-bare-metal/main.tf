resource "ibm_compute_bare_metal" "host" {
  package_key_name       = "DUAL_INTEL_XEON_PROC_CASCADE_LAKE_SCALABLE_FAMILY_12_DRIVES"
  process_key_name       = "INTEL_INTEL_XEON_8260_2_40"
  memory                 = 768
  #os_key_name            = "OS_VMWARE_SERVER_VIRTUALIZATION_7_0_UPDATE_3I_UEFI"
  os_key_name            = "OS_NO_OPERATING_SYSTEM"
  hostname               = var.name
  domain                 = var.domain_name
  datacenter             = var.datacenter
  network_speed          = var.network_speed
  public_bandwidth       = 20000
  disk_key_names         = ["HARD_DRIVE_1_00_TB_SATA_2", "HARD_DRIVE_1_00_TB_SATA_2", "HARD_DRIVE_960GB_SSD", "HARD_DRIVE_960GB_SSD", "HARD_DRIVE_3_8TB_SSD_3DWPD", "HARD_DRIVE_3_8TB_SSD_3DWPD", "HARD_DRIVE_3_8TB_SSD_3DWPD", "HARD_DRIVE_3_8TB_SSD_3DWPD", "HARD_DRIVE_3_8TB_SSD_3DWPD", "HARD_DRIVE_3_8TB_SSD_3DWPD"]
  hourly_billing         = false
  private_network_only   = false
  unbonded_network       = true
  public_vlan_id         = var.public_vlan
  private_vlan_id        = var.private_vlan
  tags                   = var.tags
  redundant_power_supply = true

  storage_groups { 
      # RAID 1
      array_type_id = 2
  
      # Use two disks
      hard_drives = [0, 1]
      array_size  = 960
}
#  storage_groups {
#      # individual "vsan cache"
#      array_type_id = 21
#  
#      # Use two disks
#      hard_drives = [2, 3]
#}
#  storage_groups {
#      # individual "vsan capacity"
#      array_type_id = 21
#  
#      # Use six disks
#      hard_drives = [4, 5, 6, 7, 8, 9]
#}

#  storage_groups {
#    # RAID 1
#    array_type_id = 2
#    # Use the first two disks
#    hard_drives = [0, 1]
#    array_size  = 960
#
#  }
}
