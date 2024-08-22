#Assets
skip_ha_az_node_group = true
desired_size = 2
max_size = 2
min_size= 2
skip_private_subnet_creation = false
allow_all_ingress_traffic_to_cluster = true
eks_version = "1.29"

# needed value: aws-infra [to be set if workspace name is aws-infra]
aws_waf_ce = "" 
