# Turbonomic Placement API query example using Extneral Resource

## Requirements:

- Turbonomic 6.2 or higher 
- Terraform 0.12.0 or higher

## Environment Variables

To avoid being prompted you must add the following environment variables:
- TF_VAR_turbonomic_user
- TF_VAR_turbonomic_password
- TF_VAR_turbonomic_rest_endpoint 

Your Turbonomic REST endpoint is your Turbonomic URL and the trailing /api/v2 (example: https://MYTURBONOMICURL.COM/api/v2)

# Caveats

This use of external source by Terraform is generally unsupported in preference of building a first class plugin.  Turbonomic integration with Terraform Enterprise is underway which will invalidate this example method. 

Terraform External Data Source docs here:  https://www.terraform.io/docs/providers/external/data_source.html 

