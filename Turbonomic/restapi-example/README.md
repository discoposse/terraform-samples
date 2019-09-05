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

# Workarounds

Ideal workaround is to do a direct query to the Turbonomic API and parse the output for placement (see RESERVATIONS under your Swagger docs at https://YOURTURBOURL/apidoc)

<script src="https://fast.wistia.com/embed/medias/tdlagn2q8n.jsonp" async></script><script src="https://fast.wistia.com/assets/external/E-v1.js" async></script><div class="wistia_responsive_padding" style="padding:56.46% 0 0 0;position:relative;"><div class="wistia_responsive_wrapper" style="height:100%;left:0;position:absolute;top:0;width:100%;"><div class="wistia_embed wistia_async_tdlagn2q8n videoFoam=true" style="height:100%;position:relative;width:100%"><div class="wistia_swatch" style="height:100%;left:0;opacity:0;overflow:hidden;position:absolute;top:0;transition:opacity 200ms;width:100%;"><img src="https://fast.wistia.com/embed/medias/tdlagn2q8n/swatch" style="filter:blur(5px);height:100%;object-fit:contain;width:100%;" alt="" aria-hidden="true" onload="this.parentNode.style.opacity=1;" /></div></div></div></div>

Once you have the data parsed programmatically you can run a Terraform Plan/Apply and pass to your configuration as variables.  

example script flow:

- curl to get JSON from Turbonomic
- Filter with JQ to get PLACEMENTS (cpu, memory, etc.)
- Set variables with filtered outputs
- run Terraform processes by passing variables to the CLI

This will be unnecessary when Terraform Enterprise integration is completed. 

