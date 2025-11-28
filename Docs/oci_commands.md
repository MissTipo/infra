**List node-pool(node-image) options**
```bash
oci ce node-pool-options get --node-pool-option-id all --compartment-id <compartment_ocid>
```

**List clusters in a compartment**
```bash
oci ce cluster list --compartment-id <compartment_ocid>
```
**Get details of a specific cluster**
```bash
oci ce cluster get --cluster-id <cluster_ocid>
```
**List node pools in a cluster**
```bash
oci ce node-pool list --compartment-id <compartment_ocid> --cluster-id <cluster_ocid>
```

**List service network**
```bash
oci network service-network list --compartment-id <compartment_ocid>
```

**Get security-list**
```bash
oci network security-list get --security-list-id <security_list_ocid>
```

**Get route-table**
```bash
oci network route-table get --rt-id <route_table_ocid>
```

**List nat-gateway**
```bash
oci network nat-gateway list --compartment-id <compartment_ocid>
```

**Get subnet**
```bash
oci network subnet get --subnet-id <subnet_ocid>
```

**Create nat-gateway**
```bash
oci network nat-gateway create \
  --compartment-id <compartmet_ocid> \
  --vcn-id <vcn-ocid> \
  --display-name "MY_NAT_GATEWAY"
```

**Update route-table**
```bash
oci network route-table update \
  --rt-id <route_table_ocid> \
  --route-rules '[
    {
      "destination": "0.0.0.0/0",
      "destinationType": "CIDR_BLOCK",
      "networkEntityId": "<nat_gateway_ocid>"
    }
  ]'
```

**Update security-list**
```bash

    

