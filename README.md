# multidisk-boxgrinder-plugin

This platform plugin converts the RAW appliance disk to VMDK Sparse, VMDK StreamOptimized, QCOW2 Sparse and QCow2 Compressed Sparse.

## Installation

    gem install multidisk-boxgrinder-plugin

Needs VirtualBox installed to convert from VMDK Sparse to VMDK StreamOptimized.

## Usage

    boxgrinder-build -p multidisk my-appliance.appl -l multidisk-boxgrinder-plugin

## Copyright

Copyright (c) 2011 Sergio Rubio. See LICENSE.txt for
further details.

