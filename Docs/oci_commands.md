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
oci network security-list update \
  --security-list-id <security_list_ocid> \
  --ingress-security-rules '[
    {
      "protocol": "6",
      "source": "
      "sourceType": "CIDR_BLOCK",
      "tcpOptions": {
        "destinationPortRange": {
          "max": 443,
          "min": 443
        }
      }
    }
  ]'
```

**List region list**
```bash
oci iam region list
```
**List load balancers in a compartment**
```bash
oci lb load-balancer list --compartment-id <compartment_ocid>
```

**Create load balancer**
```bash
oci lb load-balancer create \
  --compartment-id "<compartment_ocid" \
  --display-name "<name>" \
  --shape-name "flexible" \
  --shape-details '{"maximumBandwidthInMbps": 100, "minimumBandwidthInMbps": 10}' \
  --subnet-ids '["<subnet_ocid"]'
```

**Create backend set**
```bash
oci lb backend-set create \
  --load-balancer-id <load_balancer_ocid> \
  --name infra-dev-backendset \
  --policy ROUND_ROBIN \
  --health-checker-port 80 \
  --health-checker-protocol HTTP \
  --health-checker-url-path / \
  --health-checker-retries 3 \
  --health-checker-return-code 200
```
**List compute instances in a compartment**
```bash
oci compute instance list --compartment-id <compartment_ocid>
```
**List vnic-attachments for a compute instance**
```bash
oci compute vnic-attachment list --compartment-id <compartment_ocid> --instance-id <instance_ocid>
```
**Get vnic details**
```bash
oci network vnic get --vnic-id <vnic_ocid>
```
**Create lb listener**
```bash
oci lb listener create \
  --load-balancer-id <load_balancer_ocid> \
  --name infra-dev-listener \
  --default-backend-set-name infra-dev-backendset \
  --protocol HTTP \
  --port 80
```

    

