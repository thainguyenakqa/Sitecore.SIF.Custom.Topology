# Introduction
Trimmed down Sitecore 10 SIF based installation with XP0 + Content Delivery + Commerce.  
Without SXA or default storefront.

This repository belongs to a 3-part post:  
1. [Custom Sitecore XP Installation](https://www.linkedin.com/pulse/sitecore-10-custom-topology-sif-thai-nguyen/)
2. [Custom Sitecore Commerce Installation part 1](https://www.linkedin.com/pulse/sitecore-10-commerce-custom-topology-sif-thai-nguyen/)
3. [Custom Sitecore Commerce Installation part 2](https://www.linkedin.com/pulse/sitecore-10-commerce-engine-custom-package-thai-nguyen/)

# Requirements
Remember to install https://git-lfs.github.com/ before cloning, since there are some big files in this repository.

# Installation
Run the installation scripts in the following order:

1. [git root]\install\ajax.0.prerequisites.ps1
2. [git root]\install\ajax.1.developer.ps1
3. [git root]\install\ajax.2.post.ps1
4. [git root]\install\ajax.3.commerce.ps1

This will install Solr and Redis on the default ports in your system drive and the Sitecore IIS instances in your [git root]\www folder.

Please make sure to check through the installation script for the right settings, paths and logins before running the installation scripts.

Enjoy!