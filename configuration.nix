# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ inputs, config, pkgs, ... }:

{
  
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Bootloader.

  boot = {
   loader.systemd-boot.enable = true;
   loader.efi.canTouchEfiVariables = true;
   loader.timeout = 0;
   loader.systemd-boot.configurationLimit = 5;
};



console = {
    earlySetup = true;
    keyMap = "us";
    colors = [
    "2E3440"
    "BC567F"
    "A3BE8C"
    "D8A6AD"
    "5E81AC"
    "BF616A"
    "ECEFF4"
    "FFFFFF"
    ];
  };

  networking.hostName = "GholesrolK"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Africa/Tripoli";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "ar_LY.UTF-8";
    LC_IDENTIFICATION = "ar_LY.UTF-8";
    LC_MEASUREMENT = "ar_LY.UTF-8";
    LC_MONETARY = "ar_LY.UTF-8";
    LC_NAME = "ar_LY.UTF-8";
    LC_NUMERIC = "ar_LY.UTF-8";
    LC_PAPER = "ar_LY.UTF-8";
    LC_TELEPHONE = "ar_LY.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };
  fonts.fontDir.enable = true ;	
  services.xserver.enable = true ;
services.greetd = {
  enable = true;
  settings = {
    default_session = {
      command = "${pkgs.greetd.tuigreet}/bin/tuigreet --theme 'border=magenta;text=cyan;prompt=green;time=red;action=blue;button=yellow;container=black;input=red' --time -r --cmd startx ";
      user = "greeter";
    };
  };
};

  services.xserver.displayManager.startx.enable = true ;
  # Configure keymap in X11
  services.xserver = {
    xkb.layout = "us";
    xkb.variant = "";
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.ahmed = {
    isNormalUser = true;
    description = "ahmed";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [];
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;
 
 hardware.bluetooth.enable = true; 
 hardware.bluetooth.powerOnBoot = true; 

  services.xserver.windowManager.dwm.enable = true ;
  nixpkgs.overlays = [
      (final : prev: {
  dwm = prev.dwm.overrideAttrs (old : { src = /home/ahmed/src/dwm ; } );
  dwmblocks = prev.dwmblocks.overrideAttrs (old : { src = /home/ahmed/src/dwmblocks ; } );
  dmenu = prev.dmenu.overrideAttrs (old : { src = /home/ahmed/src/dmenu ; } ); 
   
}) 


];
  hardware = {
  opengl.enable = true ; 

 };

 nix.settings.trusted-users = [ "root" "ahmed" ];
 nix.settings.auto-optimise-store = true;
 nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 1w";
  };

 hardware.nvidia = {

    # Modesetting is required.
    modesetting.enable = true;


    powerManagement.enable = false;

    powerManagement.finegrained = false;


    open = true;

    nvidiaSettings = true;

    package = config.boot.kernelPackages.nvidiaPackages.stable;


    prime = {
	 
   offload = {
			enable = true;
			enableOffloadCmd = true;
		};
		intelBusId = "PCI:0:2:0";
		nvidiaBusId = "PCI:1:0:0";
                
	  };
  };
  services.xserver.dpi = 96;
  
services.xserver.videoDrivers = ["nvidia"];

  services.picom = {
    enable = true;
  };



 qt.enable = true;
  qt.platformTheme = "gtk2";
  qt.style = "gtk2";

security.polkit.enable = true;
security.polkit.extraConfig = ''
    polkit.addRule(function(action, subject) {
      if (subject.isInGroup("wheel"))
        return polkit.Result.YES;
    });
  '';



security.rtkit.enable = true ;



services.pipewire = {
  enable = true ;
  alsa.enable = true ; 
  alsa.support32Bit = true ;
  pulse.enable = true ;
  jack.enable = true ;
};
 programs.thunar.enable = true;
 programs.thunar.plugins = with pkgs.xfce; [ 
  thunar-archive-plugin 
  thunar-volman

   ];
   
  services.gvfs.enable = true;
  
  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
  #  vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
  #  wget
 wget 
git 
lshw
foot
greetd.tuigreet
hyprlock 
cage
waybar
dunst
libnotify
firefox
neofetch
meson 
wayland-protocols
wayland-utils
wl-clipboard
dwmblocks
dmenu
pavucontrol
lxappearance
zuki-themes 
vscodium
font-awesome
luna-icons
xwallpaper
xdotool
feh
pywal
lm_sensors
discord
caprine-bin
ntfs3g
jq
bottles
heroic
lutris
protonup
pywalfox-native
blueberry
ags
kanshi
vesktop
playerctl
brightnessctl
pw-volume
cascadia-code
swaylock
swww
adw-gtk3
morewaita-icon-theme
dart-sass
nodejs_22
nodePackages.ts-node
gjs
gnomeExtensions.eval-gjs
gtk3
gtk-layer-shell
libdbusmenu-gtk3
gobject-introspection
btop
zip
unzip
gtksourceview
webkitgtk
libgtop
matugen
nwg-look
adwaita-qt
adwaita-qt6
themechanger
cava
networkmanagerapplet
qbittorrent
kdePackages.qt6ct
docker-compose
pcsx2
kitty
stalonetray
killall
gpu-screen-recorder
gpu-screen-recorder-gtk
lf
polkit_gnome
xdg-desktop-portal-gtk
bibata-cursors
adwaita-icon-theme
];


environment.variables = {
GI_TYPELIB_PATH = "/run/current-system/sw/lib/girepository-1.0";
GDK_SCALE = "0.5";
WLR_NO_HARDWARE_CURSORS = "1";
NIXOS_OZONE_WL = "1";


};

xdg.portal.enable = true;
xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };


programs.steam.enable = true;
programs.steam.gamescopeSession.enable = true;
programs.gamemode.enable = true;

fonts.packages = with pkgs; [
  noto-fonts
  noto-fonts-cjk
  noto-fonts-emoji
  liberation_ttf
  fira-code
  fira-code-symbols
  mplus-outline-fonts.githubRelease
  dina-font
  proggyfonts
  font-awesome
  jetbrains-mono
  cascadia-code
];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };
  

  
  # List services that you want to enable:

  # Enable the OpenSSH daemon.
   services.openssh.enable = true;
   #DOCKER 
   virtualisation.docker.enable = true;
   users.extraGroups.docker.members = [ "ahmed" ];

   #OLLAMA
   services.ollama = {
  enable = true;
  acceleration = "cuda";
};
  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).


  system.stateVersion = "24.05"; # Did you read the comment?
  nix.settings.experimental-features = ["nix-command" "flakes"];

}
