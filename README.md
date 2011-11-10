# multidisk-boxgrinder-plugin

This platform plugin converts the RAW appliance disk to VMDK Sparse, VMDK StreamOptimized, QCOW2 Sparse and QCow2 Compressed Sparse.

## Installation

    gem install multidisk-boxgrinder-plugin

Needs VirtualBox installed to convert from VMDK Sparse to VMDK StreamOptimized.

## Usage

    boxgrinder-build -p multidisk f15-jeos.appl -l multidisk-boxgrinder-plugin
    
After the build has finished, you'll find the additional disk formats under build/appliances/x86_64/fedora/15/f15-jeos/1.0/multidisk-plugin

    $ ls build/appliances/x86_64/fedora/15/f15-jeos/1.0/multidisk-plugin/
    f15-jeos-compressed.qcow2  f15-jeos-sparse.qcow2  f15-jeos-sparse.vmdk  f15-jeos-streamoptimized.vmdk

## Copyright

Copyright (c) 2011 Sergio Rubio. See LICENSE.txt for
further details.

