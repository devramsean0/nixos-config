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
    git clone https://github.com/devramsean0/nixos-config.git
    echo "Copying config"
    cp ./nixos-config .

    #
    # Setup Config
    #
    echo "Setting up the config"
    mv ../hardware-configuration.nix hardware-configuration.nix
    echo "Setting minimal configuration.nix"
    echo "{ config, pkgs, ... }: { networking.hostName = 'laptop';  system.stateVersion = '23.05'; }" > configuration.nix
else
    echo "Please provide a hostname"
fi