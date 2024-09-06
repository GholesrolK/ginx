{
  description ="Main Flake";



  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  


  };


   

  outputs = {self , nixpkgs , ... } @ inputs :
let 
lib = nixpkgs.lib;
  
pkgs = nixpkgs.legacyPackages.${"x86_64-linux"};
in {
   nixosConfigurations = {
    GholesrolK = lib.nixosSystem {
     system = "x86_64-linux";
     specialArgs = { inherit inputs; };
     modules = [ ./configuration.nix ];
     

};


};




};






}
