{ config, pkgs, ... }:

{
    # Allow unfree packages
    nixpkgs.config.allowUnfree = true;

    # List packages installed in system profile. To search, run:
    # $ nix search wget
    environment.systemPackages = with pkgs; [
        # vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
        wget
        fastfetch
        uv
        sqlite
        ngrok

        google-chrome
        vlc
        vscode
        discord
        spotify
        obsidian
        bitwarden-desktop

        gnomeExtensions.alphabetical-app-grid
        gnomeExtensions.transparent-top-bar-adjustable-transparency
        gnomeExtensions.just-perfection
        gnomeExtensions.tactile

        nvpy
    ];

    environment.gnome.excludePackages = with pkgs; [
        orca
        # evince
        # file-roller
        geary
        # gnome-disk-utility
        seahorse
        # sushi
        sysprof
        #
        # gnome-shell-extensions
        #
        # adwaita-icon-theme
        # nixos-background-info
        gnome-backgrounds
        # gnome-bluetooth
        # gnome-color-manager
        # gnome-control-center
        # gnome-shell-extensions
        gnome-tour # GNOME Shell detects the .desktop file on first log-in.
        gnome-user-docs
        # glib # for gsettings program
        # gnome-menus
        # gtk3.out # for gtk-launch program
        # xdg-user-dirs # Update user dirs as described in https://freedesktop.org/wiki/Software/xdg-user-dirs/
        # xdg-user-dirs-gtk # Used to create the default bookmarks
        #
        baobab
        epiphany
        gnome-text-editor
        # gnome-calculator
        gnome-calendar
        gnome-characters
        # gnome-clocks
        # gnome-console
        gnome-contacts
        gnome-font-viewer
        gnome-logs
        gnome-maps
        gnome-music
        # gnome-system-monitor
        gnome-weather
        # loupe
        # nautilus
        gnome-connections
        simple-scan
        snapshot
        totem
        yelp
        gnome-software
    ];

    # Some programs need SUID wrappers, can be configured further or are
    # started in user sessions.
    # programs.mtr.enable = true;
    # programs.gnupg.agent = {
    #   enable = true;
    #   enableSSHSupport = true;
    # };

    programs = {
        steam = {
            enable = true;
            remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
            dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
            localNetworkGameTransfers.openFirewall = true; # Open ports in the firewall for Steam Local Network Game Transfers
        };

        nix-ld.enable = true;
        nix-ld.libraries = with pkgs; [
            # Add any missing dynamic libraries for unpackaged programs
            # here, NOT in environment.systemPackages
        ];
    };

    # Remove NixOS manual shortcut in applications menu
    documentation.nixos.enable = false;
}