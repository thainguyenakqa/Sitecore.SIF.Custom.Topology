# Sitecore.SIF.Custom.Development.Topology
Trimmed down Sitecore 10 SIF based installation with XP0 + Content Delivery + Commerce.
Without SXA or default storefront.

Run the installation scripts in the following order:

[git root]\install\ajax.0.prerequisites.ps1
[git root]\install\ajax.1.developer.ps1
[git root]\install\ajax.2.post.ps1
[git root]\install\ajax.3.commerce.ps1

This will install Solr and Redis on the default ports in your system drive and the Sitecore IIS instances in your [git root]\www folder.

Please make sure to check through the installation script for the right settings, paths and logins before running the installation scripts.

Enjoy!