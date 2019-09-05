# Turbonomic Placement API query example

## Requirements:

- Turbonomic 6.2 or higher 
- Terraform 0.12.0 or higher
- Terraform restapi plugin in your path (https://github.com/Mastercard/terraform-provider-restapi)

## Environment Variables

To avoid being prompted you must add the following environment variables:
- TF_VAR_turbonomic_user
- TF_VAR_turbonomic_password
- TF_VAR_turbonomic_rest_endpoint 

Your Turbonomic REST endpoint is your Turbonomic URL and the trailing /api/v2 (example: https://MYTURBONOMICURL.COM/api/v2)

# Caveats

This does not manage state because of an issue pulling JSON results back into the restapi resource. This is meant as a way to interact with API but will not work in subsequent runs because the JSON results return a map instead of a string.  Work being done to test alternative ways to do this.  The better goal is to fully integrate with Terraform Enterprise and a native plugin.

