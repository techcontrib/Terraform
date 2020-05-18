Terraform code to create VPC, Subnet, IGW, Route Table, Security Group with apt ingress/egress rules, route associations and finally importing the key + EC2 instance creation. 

This is just a test code and cannot be considered as production ready!!  Use it for education purpose and build advance code by refering this test code. 
======================================================================================================================================

Example output for terraform plan

😿  [---------] terraform apply
data.aws_ami.aws_linux_2_latest: Refreshing state...
data.aws_ami_ids.aws_linux_2_latest_ids: Refreshing state...

An execution plan has been generated and is shown below.
Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # aws_instance.StageInstance will be created
  + resource "aws_instance" "StageInstance" {
      + ami                          = "ami-0323c3dd2da7fb37d"
      + arn                          = (known after apply)
      + associate_public_ip_address  = true
      + availability_zone            = (known after apply)
      + cpu_core_count               = (known after apply)
      + cpu_threads_per_core         = (known after apply)
      + get_password_data            = false
      + host_id                      = (known after apply)
      + id                           = (known after apply)
      + instance_state               = (known after apply)
      + instance_type                = "t2.medium"
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

  # aws_internet_gateway.IGW-US-STAGE will be created
  + resource "aws_internet_gateway" "IGW-US-STAGE" {
      + id       = (known after apply)
      + owner_id = (known after apply)
      + tags     = {
          + "Name" = "IGW-US-STAGE"
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

  # aws_route_table.RT-US-STAGE will be created
  + resource "aws_route_table" "RT-US-STAGE" {
      + id               = (known after apply)
      + owner_id         = (known after apply)
      + propagating_vgws = (known after apply)
      + route            = [
          + {
              + cidr_block                = "0.0.0.0/0"
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
          + "Name" = "RT-US-STAGE"
        }
      + vpc_id           = (known after apply)
    }

  # aws_route_table_association.RA-US-STAGE will be created
  + resource "aws_route_table_association" "RA-US-STAGE" {
      + id             = (known after apply)
      + route_table_id = (known after apply)
      + subnet_id      = (known after apply)
    }

  # aws_security_group.SG-US-STAGE will be created
  + resource "aws_security_group" "SG-US-STAGE" {
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
      + name                   = "SG-US-STAGE"
      + owner_id               = (known after apply)
      + revoke_rules_on_delete = false
      + tags                   = {
          + "Name" = "SG-US-STAGE"
        }
      + vpc_id                 = (known after apply)
    }

  # aws_subnet.STAGE_SUBNET30 will be created
  + resource "aws_subnet" "STAGE_SUBNET30" {
      + arn                             = (known after apply)
      + assign_ipv6_address_on_creation = false
      + availability_zone               = "us-east-1c"
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

Do you want to perform these actions?
  Terraform will perform the actions described above.
  Only 'yes' will be accepted to approve.

  Enter a value: yes

aws_key_pair.default: Creating...
aws_vpc.VPC_STAGE: Creating...
aws_key_pair.default: Creation complete after 0s [id=stage]
aws_vpc.VPC_STAGE: Creation complete after 4s [id=vpc-04980ca24bb9f9bd5]
aws_internet_gateway.IGW-US-STAGE: Creating...
aws_subnet.STAGE_SUBNET30: Creating...
aws_security_group.SG-US-STAGE: Creating...
aws_subnet.STAGE_SUBNET30: Creation complete after 2s [id=subnet-01a74c1615cff76c7]
aws_internet_gateway.IGW-US-STAGE: Creation complete after 2s [id=igw-0cd2a44f9ef3ad93a]
aws_route_table.RT-US-STAGE: Creating...
aws_route_table.RT-US-STAGE: Creation complete after 2s [id=rtb-05edbed5913f20721]
aws_route_table_association.RA-US-STAGE: Creating...
aws_security_group.SG-US-STAGE: Creation complete after 4s [id=sg-0ace1819bd9db3a22]
aws_instance.StageInstance: Creating...
aws_route_table_association.RA-US-STAGE: Creation complete after 0s [id=rtbassoc-07543a2c981aa0361]
aws_instance.StageInstance: Still creating... [10s elapsed]
aws_instance.StageInstance: Still creating... [20s elapsed]
aws_instance.StageInstance: Provisioning with 'remote-exec'...
aws_instance.StageInstance: Still creating... [30s elapsed]
aws_instance.StageInstance (remote-exec): Connecting to remote host via SSH...
aws_instance.StageInstance (remote-exec):   Host: 3.84.125.160
aws_instance.StageInstance (remote-exec):   User: ec2-user
aws_instance.StageInstance (remote-exec):   Password: false
aws_instance.StageInstance (remote-exec):   Private key: true
aws_instance.StageInstance (remote-exec):   Certificate: false
aws_instance.StageInstance (remote-exec):   SSH Agent: false
aws_instance.StageInstance (remote-exec):   Checking Host Key: false
aws_instance.StageInstance (remote-exec): Connected!
aws_instance.StageInstance (remote-exec): Loaded plugins: extras_suggestions,
aws_instance.StageInstance (remote-exec):               : langpacks, priorities,
aws_instance.StageInstance (remote-exec):               : update-motd
aws_instance.StageInstance (remote-exec): Resolving Dependencies
aws_instance.StageInstance (remote-exec): --> Running transaction check
aws_instance.StageInstance (remote-exec): ---> Package telnet.x86_64 1:0.17-65.amzn2 will be installed
aws_instance.StageInstance (remote-exec): --> Finished Dependency Resolution

aws_instance.StageInstance (remote-exec): Dependencies Resolved

aws_instance.StageInstance (remote-exec): ========================================
aws_instance.StageInstance (remote-exec):  Package
aws_instance.StageInstance (remote-exec):         Arch   Version Repository  Size
aws_instance.StageInstance (remote-exec): ========================================
aws_instance.StageInstance (remote-exec): Installing:
aws_instance.StageInstance (remote-exec):  telnet x86_64 1:0.17-65.amzn2
aws_instance.StageInstance (remote-exec):                        amzn2-core  64 k

aws_instance.StageInstance (remote-exec): Transaction Summary
aws_instance.StageInstance (remote-exec): ========================================
aws_instance.StageInstance (remote-exec): Install  1 Package

aws_instance.StageInstance (remote-exec): Total download size: 64 k
aws_instance.StageInstance (remote-exec): Installed size: 109 k
aws_instance.StageInstance (remote-exec): Downloading packages:
aws_instance.StageInstance (remote-exec): telnet-0.17-65.amz |  64 kB   00:00
aws_instance.StageInstance (remote-exec): Running transaction check
aws_instance.StageInstance (remote-exec): Running transaction test
aws_instance.StageInstance (remote-exec): Transaction test succeeded
aws_instance.StageInstance (remote-exec): Running transaction
aws_instance.StageInstance (remote-exec):   Installing : 1:telnet [         ] 1/1
aws_instance.StageInstance (remote-exec):   Installing : 1:telnet [#####    ] 1/1
aws_instance.StageInstance (remote-exec):   Installing : 1:telnet [#######  ] 1/1
aws_instance.StageInstance (remote-exec):   Installing : 1:telnet [######## ] 1/1
aws_instance.StageInstance (remote-exec):   Installing : 1:telnet-0.17-65.a   1/1
aws_instance.StageInstance (remote-exec):   Verifying  : 1:telnet-0.17-65.a   1/1

aws_instance.StageInstance (remote-exec): Installed:
aws_instance.StageInstance (remote-exec):   telnet.x86_64 1:0.17-65.amzn2

aws_instance.StageInstance (remote-exec): Complete!
aws_instance.StageInstance: Creation complete after 36s [id=i-010a33b744a192f00]

Apply complete! Resources: 8 added, 0 changed, 0 destroyed.

Outputs:

server_public_dns = ec2-3-84-125-160.compute-1.amazonaws.com
