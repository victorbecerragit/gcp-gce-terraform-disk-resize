# Simple terraform GCE VM to test root disk resize

# 1 - create a new VM using the predefined resource goolgle_compute_disk 

# 2 - change the size of the disk on variables.tf > root_disk_size_gb

# 3 - Loging to the VM and resize the disk partition and next resize the FS (default ext4)

   . resize the partition

   https://github.com/EugenMayer/parted-auto-resize


       ./resize.sh /dev/sda 1 apply
       [ok] would/will resize to from 15357MB to 21475MB 
       [ok] applying resize operation..
       Warning: Partition /dev/sda1 is being used. Are you sure you want to continue?
       parted: invalid token: 21475                                              
       Yes/No? Yes                                                               
       End?  [16.1GB]? 21475                                                     
       Information: You may need to update /etc/fstab.

   . resize the FS 
  
   resize2fs /dev/sda1  

# reboot the VM to test

# Change Machine type without rebuild all the stuff
# We will replace the default n1-standard-1 for a custom AMD.

Change variables.tf > vm_size > default = n2d-custom-2-4096   

# Sign your concern to update the VM in the compute.tf  > allow_stopping_for_update = true

terraform plan -out VM-resize.plan
terraform apply VM-resize.plan

