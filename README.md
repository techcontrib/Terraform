Terraform code to create VPC, Subnet, IGW, Route Table, Security Group with apt ingress/egress rules, route associations and finally importing the key + EC2 instance creation. 

This is just a test code and cannot be considered as production ready!!  Use it for education purpose and build advance code by refering this test code. 
======================================================================================================================================

Example output for terraform plan

# terraform plan
Refreshing Terraform state in-memory prior to plan...
The refreshed state will be used to calculate this plan, but will not be
persisted to local or remote state storage.

data.aws_ami_ids.aws_linux_2_latest_ids: Refreshing state...
data.aws_ami.aws_linux_2_latest: Refreshing state...

------------------------------------------------------------------------

An execution plan has been generated and is shown below.
Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # aws_instance.StageInstance will be created
  + resource "aws_instance" "StageInstance" {
      + ami                          = "ami-0470e33cd681b2476"
      + arn                          = (known after apply)
      + associate_public_ip_address  = true
      + availability_zone            = (known after apply)
      + cpu_core_count               = (known after apply)
      + cpu_threads_per_core         = (known after apply)
      + get_password_data            = false
      + host_id                      = (known after apply)
      + id                           = (known after apply)
      + instance_state               = (known after apply)
      + instance_type                = "t2.micro"
      + ipv6_address_count           = (known after apply)
      + ipv6_addresses               = (known after apply)
      + key_name                     = (known after apply)
      + network_interface_id         = (known after apply)
      + outpost_arn                  = (known after apply)
      + password_data                = (known after apply)
      + placement_group              = (known after apply)
      + primary_network_interface_id = (known after apply)
      + private_dns                  = (known after apply)
      + private_ip                   = (known after apply)
      + public_dns                   = (known after apply)
      + public_ip                    = (known after apply)
      + security_groups              = (known after apply)
      + source_dest_check            = false
      + subnet_id                    = (known after apply)
      + tenancy                      = (known after apply)
      + volume_tags                  = (known after apply)
      + vpc_security_group_ids       = (known after apply)

      + ebs_block_device {
          + delete_on_termination = (known after apply)
          + device_name           = (known after apply)
          + encrypted             = (known after apply)
          + iops                  = (known after apply)
          + kms_key_id            = (known after apply)
          + snapshot_id           = (known after apply)
          + volume_id             = (known after apply)
          + volume_size           = (known after apply)
          + volume_type           = (known after apply)
        }

      + ephemeral_block_device {
          + device_name  = (known after apply)
          + no_device    = (known after apply)
          + virtual_name = (known after apply)
        }

      + metadata_options {
          + http_endpoint               = (known after apply)
          + http_put_response_hop_limit = (known after apply)
          + http_tokens                 = (known after apply)
        }

      + network_interface {
          + delete_on_termination = (known after apply)
          + device_index          = (known after apply)
          + network_interface_id  = (known after apply)
        }

      + root_block_device {
          + delete_on_termination = (known after apply)
          + device_name           = (known after apply)
          + encrypted             = (known after apply)
          + iops                  = (known after apply)
          + kms_key_id            = (known after apply)
          + volume_id             = (known after apply)
          + volume_size           = (known after apply)
          + volume_type           = (known after apply)
        }
    }

  # aws_internet_gateway.IGW-APAC-STAGE will be created
  + resource "aws_internet_gateway" "IGW-APAC-STAGE" {
      + id       = (known after apply)
      + owner_id = (known after apply)
      + tags     = {
          + "Name" = "IGW-APAC-STAGE"
        }
      + vpc_id   = (known after apply)
    }

  # aws_key_pair.default will be created
  + resource "aws_key_pair" "default" {
      + fingerprint = (known after apply)
      + id          = (known after apply)
      + key_name    = "stage"
      + key_pair_id = (known after apply)
      + public_key  = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCFj5UPQVZal6NRUQkI0GePT+rxSFo5iZ/zokVnE89dtN7U0O7AYWMPKsu4TqsMJSmYIXvMmcfdt10LK6V9hay9uTkQh+kOYr7Gl1v7mQKdCfe8FDtfUz0VtKta9CVRv8u9aOhQROtZ8MhtS6wqhQhaosDq9tubmpQEO4T8FVPS2mGNiywe362rpJsCvb0okjjHk56uFsJgMyAyAOCdtkzSBmauglgzoHJPOe/uUapstx3xRwWfkvfLnaR+c/SNhGHcGWamT/VID7JDwssUGcoEG66xCVxr5Fbr/2We7nebxXHTxzRc7ABBuz0JGhcB6/LqtAtnEXpinoi7aXwnud6D"
    }

  # aws_route_table.RT-APAC-STAGE will be created
  + resource "aws_route_table" "RT-APAC-STAGE" {
      + id               = (known after apply)
      + owner_id         = (known after apply)
      + propagating_vgws = (known after apply)
      + route            = [
          + {
              + cidr_block                = "10.30.1.0/24"
              + egress_only_gateway_id    = ""
              + gateway_id                = (known after apply)
              + instance_id               = ""
              + ipv6_cidr_block           = ""
              + nat_gateway_id            = ""
              + network_interface_id      = ""
              + transit_gateway_id        = ""
              + vpc_peering_connection_id = ""
            },
        ]
      + tags             = {
          + "Name" = "RT-APAC-STAGE"
        }
      + vpc_id           = (known after apply)
    }

  # aws_route_table_association.RA-APAC-STAGE will be created
  + resource "aws_route_table_association" "RA-APAC-STAGE" {
      + id             = (known after apply)
      + route_table_id = (known after apply)
      + subnet_id      = (known after apply)
    }

  # aws_security_group.SG-APAC-STAGE will be created
  + resource "aws_security_group" "SG-APAC-STAGE" {
      + arn                    = (known after apply)
      + description            = "Managed by Terraform"
      + egress                 = [
          + {
              + cidr_blocks      = [
                  + "0.0.0.0/0",
                ]
              + description      = ""
              + from_port        = 0
              + ipv6_cidr_blocks = []
              + prefix_list_ids  = []
              + protocol         = "-1"
              + security_groups  = []
              + self             = false
              + to_port          = 0
            },
        ]
      + id                     = (known after apply)
      + ingress                = [
          + {
              + cidr_blocks      = [
                  + "0.0.0.0/0",
                ]
              + description      = ""
              + from_port        = -1
              + ipv6_cidr_blocks = []
              + prefix_list_ids  = []
              + protocol         = "icmp"
              + security_groups  = []
              + self             = false
              + to_port          = -1
            },
          + {
              + cidr_blocks      = [
                  + "0.0.0.0/0",
                ]
              + description      = ""
              + from_port        = 22
              + ipv6_cidr_blocks = []
              + prefix_list_ids  = []
              + protocol         = "tcp"
              + security_groups  = []
              + self             = false
              + to_port          = 22
            },
        ]
      + name                   = "SG-APAC-STAGE"
      + owner_id               = (known after apply)
      + revoke_rules_on_delete = false
      + tags                   = {
          + "Name" = "SG-APAC-STAGE"
        }
      + vpc_id                 = (known after apply)
    }

  # aws_subnet.STAGE_SUBNET30 will be created
  + resource "aws_subnet" "STAGE_SUBNET30" {
      + arn                             = (known after apply)
      + assign_ipv6_address_on_creation = false
      + availability_zone               = "ap-south-1c"
      + availability_zone_id            = (known after apply)
      + cidr_block                      = "10.30.1.0/24"
      + id                              = (known after apply)
      + ipv6_cidr_block                 = (known after apply)
      + ipv6_cidr_block_association_id  = (known after apply)
      + map_public_ip_on_launch         = false
      + owner_id                        = (known after apply)
      + tags                            = {
          + "Name" = "STAGE_SUBNET30"
        }
      + vpc_id                          = (known after apply)
    }

  # aws_vpc.VPC_STAGE will be created
  + resource "aws_vpc" "VPC_STAGE" {
      + arn                              = (known after apply)
      + assign_generated_ipv6_cidr_block = false
      + cidr_block                       = "10.30.0.0/16"
      + default_network_acl_id           = (known after apply)
      + default_route_table_id           = (known after apply)
      + default_security_group_id        = (known after apply)
      + dhcp_options_id                  = (known after apply)
      + enable_classiclink               = (known after apply)
      + enable_classiclink_dns_support   = (known after apply)
      + enable_dns_hostnames             = true
      + enable_dns_support               = true
      + id                               = (known after apply)
      + instance_tenancy                 = "default"
      + ipv6_association_id              = (known after apply)
      + ipv6_cidr_block                  = (known after apply)
      + main_route_table_id              = (known after apply)
      + owner_id                         = (known after apply)
      + tags                             = {
          + "Name" = "VPC_STAGE"
        }
    }

Plan: 8 to add, 0 to change, 0 to destroy.

------------------------------------------------------------------------

Note: You didn't specify an "-out" parameter to save this plan, so Terraform
can't guarantee that exactly these actions will be performed if
"terraform apply" is subsequently run.
