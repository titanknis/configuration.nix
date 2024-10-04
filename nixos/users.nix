{ config, lib, pkgs, ... }:

{
  # user configuration
  users.users.titanknis = {
    isnormaluser = true;
    home = "/home/titanknis";
    description = "system master";
    extragroups = [ "wheel" "networkmanager" "libvirtd" "kvm" ];  # add user to sudo and other groups
  };

}

