{
  description ="Main Flake";



  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    
  


  };


   

  outputs = {self , nixpkgs , ... }:
let 
lib = nixpkgs.lib;
in {
   nixosConfigurations = {
    GholesrolK = lib.nixosSystem {
     system = "x86_64-linux";
     
     modules = [ ./configuration.nix ];


};


};




};






}
