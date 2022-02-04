module "DataCenter-Enviroment_1E" {

  source  = "WEEMR/DataCenter_Enviroment_1E/aws"
  version = "0.1.1"

  # ------------------------------------------------------ AWS Account Settings ------------------------------------------ #

  access_key = "YOUR ACCESS KEY"
  secret_key = "YOUR SECRET KEY"

  # ------------------------------------------------------ Variables ----------------------------------------------------- #

  username = "jdoe"  #  Your 1st Initial, Last Name to tag resources i.e jdoe
  keyname  = "YOUR AWS KEY NAME"   #  Your AWS Keypair name to create resources
  Password = "Fortinet123!"        #  TO DO: Change the password from "fortinet123" to your own password

  # ------------------------------------------------------  DNS ------------------------------------------------------------ #

  Public_Hosted_Zone = "YOUR DOMAIN NAME"            # You must have a domain registerd with AWS Route53 or Managed by AWS with a Hosted Zone Created. i.e xyz.com
  SubHosted_Zone     = "jdoe.fortinetpslab.com" # Creates a Public SubHosted zone  - Enter a sub-hosted name for the domain above. i.e lab.xyz.com

  # ------------------------------------------------------ Reference Module ------------------------------------------------ #

  #            Terraform Registery Module = https://registry.terraform.io/modules/WEEMR/DataCenter_Enviroment_1E/aws/latest

  #                             Source Code = https://github.com/WEEMR/terraform-aws-DataCenter_Enviroment_1E

}


#  ----------------  Outputs  -----------------  # 

output "US_East_VPC_ID" {
  value = module.DataCenter-Enviroment_1E.AWS_US_East_VPC_ID
}

output "Spoke_1_WAN_1_IP" {
  value = module.DataCenter-Enviroment_1E.spoke_1_WAN_1_EIP
}

output "Spoke_1_WAN_2_IP" {
  value = module.DataCenter-Enviroment_1E.spoke_1_WAN_2_EIP
}

output "Spoke1_FGT_DNS_Name" {
  value = module.DataCenter-Enviroment_1E.Spoke1_FGT_DNS_Name
}

output "Spoke1_Linux_DNS_Name" {
  value = module.DataCenter-Enviroment_1E.Spoke1_Linux_DNS_Name
}

output "Spoke1_Windows_DNS_Name" {
  value = module.DataCenter-Enviroment_1E.Spoke1_Windows_DNS_Name
}

output "Spoke1_Windows_Password" {
  value = rsadecrypt(module.DataCenter-Enviroment_1E.Spoke1_Windows_Password, file("./WRady_AWS_FTNT_Key.pem"))
}
