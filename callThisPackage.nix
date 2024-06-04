{ pkgs ? import <nixpkgs> {}}:
with pkgs;
{
  default = pkgs.callPackage ./default.nix { fetchFromGithub = pkgs.fetchFromGithub;};
  #{ buildPythonPackage = pkgs.buildPythonPackage; fetchFromGithub = pkgs.fetchFromGithub; requests = pkgs.python312packages.requests; };
}
