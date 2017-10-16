# Terraform deploy for DigitalRebar Admin node on Packet.net 

This is the Terraform script that will deploy a Digital Rebar admin node in a Packet.net Ubuntu server.  This is super experimental, so it is not recommended for production deployments.  Seriously, this is a terrible script to use for production.  It was a good mini-lesson in some Terraform goodness. 

Blog pending on how it's all put together.

IMPORTANT NOTE:  The node deploys with the default password. Please follow the instructions to login and change password according to the Digital Rebar defauld configuration here: http://digital-rebar.readthedocs.io/en/latest/deployment/install/quick.html

### What you'll find here

File structure is broken out to a hopefully proper separation of logical content.  Variables must be defined in your environment when you launch.  

This deployment is for a Packet.net installation of a Type 0 node and a public DNS configuration using AWS Route53.  