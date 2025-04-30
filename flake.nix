{
  description ="Main Flake";



  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    chaotic.url = "github:chaotic-cx/nyx/nyxpkgs-unstable";
    hyprland.url = "github:hyprwm/Hyprland";
    hyprland-plugins = {
      url = "github:hyprwm/hyprland-plugins";
      inputs.hyprland.follows = "hyprland";
    };



  };


   

  outputs = {self , nixpkgs ,chaotic , ... } @ inputs :
let 
lib = nixpkgs.lib;
  
pkgs = nixpkgs.legacyPackages.${"x86_64-linux"};
in {
   nixosConfigurations = {
    GholesrolK = lib.nixosSystem {
     system = "x86_64-linux";
     specialArgs = { inherit inputs; };
     modules = [ ./configuration.nix
       chaotic.nixosModules.default      
      ];
     

};


};




};






}
