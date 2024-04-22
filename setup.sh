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
    echo "Setting up the config"
    mv ../hardware-configuration.nix hardware-configuration.nix
    echo "Setting minimal configuration.nix"
else
    echo "Please provide a hostname"
fi