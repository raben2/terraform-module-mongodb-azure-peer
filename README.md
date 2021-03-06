# mongodb-atlas-cluster
Create a Mongodb Atlas cluster with peering connection to Azure

## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| mongodbatlas | 0.8.2 |
| random | n/a |

## Prerequisites 
### Azure
The peering service principal has to be created via `az` cli tool

`az ad sp create --id $PEER_SP_UUID`

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| atlas\_mongo\_cidr | target cidr for the peering connection | `string` | `""` | no |
| atlas\_mongo\_cluster\_type | Configure cluster type | `string` | `"REPLICASET"` | no |
| atlas\_mongo\_offering | instance type to use | `string` | `"M20"` | no |
| atlas\_mongo\_org | mongodb organization id | `string` | `""` | no |
| atlas\_mongo\_provider | Cloud provider | `string` | `""` | no |
| atlas\_mongo\_region | atlas mongo identifier for azure region | `string` | `"EUROPE_WEST"` | no |
| atlas\_mongo\_replicas | replication factor | `number` | `3` | no |
| atlas\_mongo\_version | database version | `string` | `""` | no |
| audit\_team | mongo atlas team for read only project access | `string` | `""` | no |
| auto\_scaling\_compute\_enabled | Specifies wether compute up scaling is enabled. | `bool` | `false` | no |
| auto\_scaling\_compute\_scale\_down\_enabled | Specifies wether compute down scaling is enabled. | `bool` | `false` | no |
| auto\_scaling\_disk\_gb\_enabled | Specifies whether disk auto-scaling is enabled. For M2 and M5 it must be false. | `bool` | `false` | no |
| backup\_reference\_hour | hour for the first daily snapshot to be taken | `number` | `3` | no |
| backup\_reference\_minute | minute for the first daily snapshot to be taken | `number` | `0` | no |
| backup\_retention\_window\_days | number of days to be able to run point-in-time recovery operations | `number` | `6` | no |
| daily\_snapshot\_frequency | number of days between snapshots | `number` | `3` | no |
| daily\_snapshot\_retention | retention in days to keep hourly snapshots | `number` | `15` | no |
| disk\_size\_gb | The size in gigabytes of the server’s root volume. Maximum possible value of 4096 (i.e., 4 TB), minimum 10GB. | `number` | `10` | no |
| env | environment | `string` | `""` | no |
| hourly\_snapshot\_frequency | number of hours between snapshots | `number` | `6` | no |
| hourly\_snapshot\_retention | retention in days to keep hourly snapshots | `number` | `1` | no |
| mongodb\_collection\_name | main collection name(s) | `list(string)` | `[]` | no |
| monthly\_snapshot\_frequency | number of months between snapshots | `number` | `1` | no |
| monthly\_snapshot\_retention | retention in months to keep monthly snapshots | `number` | `6` | no |
| name | base name | `string` | `""` | no |
| number\_of\_shards | shards created per default | `number` | `1` | no |
| peer\_cidr | cidr subnet of the vnet for peering | `string` | `"0.0.0.0/0"` | no |
| peering\_enabled | Helper variable for network peering | `bool` | `false` | no |
| provider\_auto\_scaling\_compute\_max\_instance\_size | maximum instance size if scaling enabled | `string` | `"M20"` | no |
| provider\_auto\_scaling\_compute\_min\_instance\_size | minimum instance size if scaling enabled | `string` | `"M10"` | no |
| provider\_backup\_enabled | Set to true to enable Atlas continuous backups for the cluster | `bool` | `true` | no |
| public\_access\_enabled | allow database access from everywhere | `bool` | `false` | no |
| resource\_group\_name | azure resource group name | `string` | `""` | no |
| subscription | azure subscription id | `string` | `""` | no |
| team | MongoDB atlas Team for project access | `string` | `""` | no |
| tenant | azure ad tenant id | `string` | `""` | no |
| vnet\_name | name of the peering vnet | `string` | `""` | no |
| weekly\_snapshot\_frequency | number of weeks between snapshots | `number` | `1` | no |
| weekly\_snapshot\_retention | retention in weeks to keep weekly snapshots | `number` | `4` | no |

## Outputs

| Name | Description |
|------|-------------|
| mongo\_admin\_user\_password | n/a |
| mongo\_app\_user\_password | n/a |
| mongo\_audit\_user\_password | n/a |
| mongodb\_peering\_id | n/a |
| private\_endpoints | n/a |

