# mongodb-atlas-cluster
Create a Mongodb Atlas cluster with peering connection to Azure

## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| mongodbatlas | 0.6.0 |
| random | n/a |

## Prerequisites 
### Azure
The peering service principal has to be created via `az` cli tool

`az ad sp create --id $PEER_SP_UUID`

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| atlas\_mongo\_cidr | target cidr for the peering connection | `string` | `""` | no |
| atlas\_mongo\_offering | instance type to use | `string` | `"M2"` | no |
| atlas\_mongo\_org | mongodb organization id | `string` | `""` | no |
| atlas\_mongo\_provider | Cloud provider | `string` | `""` | no |
| atlas\_mongo\_region | atlas mongo identifier for azure region | `string` | `"EUROPE_WEST"` | no |
| atlas\_mongo\_replicas | replication factor | `number` | `3` | no |
| atlas\_mongo\_version | database version | `string` | `""` | no |
| auto\_scaling\_disk\_gb\_enabled | Specifies whether disk auto-scaling is enabled. For M2 and M5 it must be false. | `bool` | `false` | no |
| disk\_size\_gb | The size in gigabytes of the server’s root volume. Maximum possible value of 4096 (i.e., 4 TB), minimum 10GB. | `number` | `10` | no |
| env | environment | `string` | `""` | no |
| mongodb\_collection\_name | main collection name(s) | `list(string)` | <pre>[<br>  ""<br>]</pre> | no |
| name | base name | `string` | `""` | no |
| number\_of\_shards | shards created per default | `number` | `1` | no |
| peer\_cidr | cidr subnet of the vnet for peering | `string` | `"0.0.0.0/0"` | no |
| peering\_enabled | Helper variable for network peering | `bool` | `false` | no |
| provider\_backup\_enabled | Set to true to enable Atlas continuous backups for the cluster | `bool` | `true` | no |
| resource\_group\_name | azure resource group name | `string` | `""` | no |
| subscription | azure subscription id | `string` | `""` | no |
| team | development team | `string` | `""` | no |
| tenant | azure ad tenant id | `string` | `""` | no |
| vnet\_name | name of the peering vnet | `string` | `""` | no |

## Outputs

| Name | Description |
|------|-------------|
| mongo\_admin\_user\_password | n/a |
| mongo\_app\_user\_password | n/a |
| mongodb\_peering\_id | n/a |
| private\_endpoints | n/a |

