#! /bin/bash

if [ $1 ]
then
    #
    # Directory Setup
    #

    echo "Cleaning Directory"
    rm configuration.nix
    echo "Moving Hardware Config to ../hardware-configuration.nix"
    mv hardware-configuration.nix ../hardware-configuration.nix

    #
    # Clone Repo
    #
    echo "Cloning Config"
    git clone https://github.com/devramsean0/nixos-config.git .

    #
    # Setup Config
    #
    machine_name = sudo dmidecode | grep 'Product Name'
    echo "
    mv ../hardware-configuration.nix hardware/$machine_name.nix
    echo "
else
    echo "Please provide a hostname"
fi
