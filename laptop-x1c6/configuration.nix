# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

let
  home-manager = builtins.fetchTarball "https://github.com/nix-community/home-manager/archive/release-24.11.tar.gz";
in
{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      (import "${home-manager}/nixos")
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Europe/Copenhagen";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Enable the GNOME Desktop Environment.
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  services.xserver.excludePackages = [
    pkgs.xterm
  ];
  services.xserver.desktopManager.xterm.enable = false;

  # Enable CUPS to print documents.
  # services.printing.enable = true;

  # Enable sound with pipewire.
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  services.power-profiles-daemon.enable = false;
  services.tlp.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.zatfer = {
    isNormalUser = true;
    description = "Matteo Ferrini";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
      fastfetch
	    uv
	    mods

      google-chrome
      spotify
      vscode

	    gnomeExtensions.alphabetical-app-grid
      gnomeExtensions.transparent-top-bar-adjustable-transparency
      gnomeExtensions.just-perfection
      gnomeExtensions.tactile
      gnomeExtensions.focus-changer
      gnomeExtensions.highlight-focus
    ];
  };

  # Install firefox.
  programs.firefox.enable = false;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
  #  vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
  #  wget
  ];

  environment.gnome.excludePackages = with pkgs; [
    orca
    # evince
    # file-roller
    geary
    # gnome-disk-utility
    seahorse
    # sushi
    # sysprof
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
    baobab
    epiphany
    # gnome-text-editor
    # gnome-calculator
    # gnome-calendar
    # gnome-characters
    # gnome-clocks
    # gnome-console
    gnome-contacts
    gnome-font-viewer
    gnome-logs
    gnome-maps
    # gnome-music
    gnome-weather
    # loupe
    # nautilus
    # gnome-connections
    simple-scan
    snapshot
    # totem
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

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # Remove NixOS manual shortcut in applications menu
  documentation.nixos.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.11"; # Did you read the comment?

  # Home manager setup
  home-manager.users.zatfer = {
    # The state version is required and should stay at the version you originally installed.
    home.stateVersion = "24.11";

    programs.git = {
      enable = true;
      userName = "Matteo Ferrini";
      userEmail = "mimmi.ferrini@gmail.com";
    };

    # Use `dconf watch /` and modify settings in GUI to know what to manually copy here
    dconf.settings = {
      "org/gnome/desktop/interface" = {
        color-scheme = "prefer-dark";
        enable-hot-corners = false;
      };  
      "org/gnome/mutter" = {
        edge-tiling = false;
        center-new-windows = true;
      };
      "org/gnome/mutter/keybindings" = {
        toggle-tiled-left = [];
        toggle-tiled-right = [];
      };
      "org/gnome/shell/app-switcher" = {
        current-workspace-only = true;
      };
      "org/gnome/shell/keybindings" = {
        switch-to-application-1 = [];
        switch-to-application-2 = [];
        switch-to-application-3 = [];
        switch-to-application-4 = [];
        switch-to-application-5 = [];
        switch-to-application-6 = [];
        switch-to-application-7 = [];
        switch-to-application-8 = [];
        switch-to-application-9 = [];

        focus-active-notification = [];
        toggle-application-view = ["<Super>space"];
      };
      "org/gnome/desktop/wm/keybindings" = {
        show-desktop = [];
        move-to-monitor-down = [];
        move-to-monitor-left = [];
        move-to-monitor-right = [];
        move-to-monitor-up = [];
        move-to-workspace-left = [];
        move-to-workspace-right = [];
        move-to-workspace-last = [];
        move-to-workspace-1 = ["<Shift><Super>1"];
        move-to-workspace-2 = ["<Shift><Super>2"];
        move-to-workspace-3 = ["<Shift><Super>3"];
        move-to-workspace-4 = ["<Shift><Super>4"];
        move-to-workspace-5 = [];
        move-to-workspace-6 = [];
        move-to-workspace-7 = [];
        move-to-workspace-8 = [];
        move-to-workspace-9 = [];
        switch-applications = [];
        switch-applications-backward = [];
        switch-panels = [];
        switch-panels-backward = [];
        cycle-panels = [];
        cycle-panels-backward = [];
        switch-to-workspace-last = [];
        switch-to-workspace-1 = ["<Super>1"];
        switch-to-workspace-2 = ["<Super>2"];
        switch-to-workspace-3 = ["<Super>3"];
        switch-to-workspace-4 = ["<Super>4"];
        switch-to-workspace-5 = [];
        switch-to-workspace-6 = [];
        switch-to-workspace-7 = [];
        switch-to-workspace-8 = [];
        switch-to-workspace-9 = [];
        switch-to-workspace-left = [];
        switch-to-workspace-right = [];
        switch-windows = ["<Alt>Tab"];
        switch-windows-backward = [];
        cycle-windows = [];
        cycle-windows-backward = [];
        cycle-group = [];
        cycle-group-backward = [];
        switch-group = ["<Control>Tab"];
        switch-group-backward = ["<Shift><Control>Tab"];

        focus-active-notification = [];
        toggle-quick-settings = [];
        restore-shortcuts = [];
        toggle-message-tray = ["<Super>v"];
        toggle-overview = [];
        panel-run-dialog = [];

        switch-input-source = [];
        switch-input-source-backward = [];

        activate-window-menu = ["<Alt>space"];
        close = ["<Super>q"];
        minimize = [];
        lower = [];
        maximize = [];
        maximize-horizontally = [];
        maximize-vertically = [];
        begin-move = [];
        raise = [];
        raise-or-lower = [];
        begin-resize = [];
        unmaximize = [];
        toggle-fullscreen = ["<Super>f"];
        toggle-maximized = [];
        toggle-on-all-workspaces = [];
      };
      "org/gnome/settings-daemon/plugins/media-keys" = {
        decrease-text-size = [];
        increase-text-size = [];
        toggle-contrast = [];
        on-screen-keyboard = [];
        screenreader = [];
        magnifier = [];
        magnifier-zoom-in = [];
        magnifier-zoom-out = [];

        home = [];
        calculator = [];
        email = [];
        help = [];
        www = [];
        search = [];
        control-center = [];

        screensaver = ["<Super>l"];
        logout = [];

        custom-keybindings = [
          "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/"
          "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/"
        ];
      };
      "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0" = {
        binding = "<Super>Return";
        command = "kgx";
        name = "Launch console";
      };
      "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1" = {
        binding = "<Shift><Super>r";
        command = "kgx -e sudo nixos-rebuild switch";
        name = "Rebuild nixos";
      };
      "org/gnome/desktop/wm/preferences" = {
        focus-mode = "sloppy";
        num-workspaces = "4";
      };
      "org/gnome/shell" = {
        enabled-extensions = [
          "AlphabeticalAppGrid@stuarthayhurst"
          "transparent-top-bar@ftpix.com"
          "just-perfection-desktop@just-perfection"
          "tactile@lundal.io"
          "focus-changer@heartmire"
          "highlight-focus@pimsnel.com"
        ];
        favorite-apps = [];
      };
      "org/gnome/shell/extensions/just-perfection" = {
        dash = false;
      };
      "com/ftpix/transparentbar" = {
        transparency = 0;
        dark-full-screen = true;
      };
      "org/gnome/shell/extensions/tactile" = {
        col-0 = 1;
        col-1 = 1;
        col-2 = 1;
        col-3 = 0;
        row-0 = 1;
        row-1 = 1;
        row-2 = 0;

        gap-size = 16;

        show-tiles = ["<Super>r"];
        show-settings = []; # Disable as it would clash with other keybinding
      };
      "org/gnome/shell/extensions/focus-changer" = {
        focus-up =  ["<Super>Up"];
        focus-down =  ["<Super>Down"];
        focus-left =  ["<Super>Left"];
        focus-right =  ["<Super>Right"];
      };
      "org/gnome/shell/extensions/highlight-focus" = {
        keybinding-highlight-now = [];
        border-color = "#9278C6";
        border-width = 6;
        border-radius = 8;
        disable-hiding = true;
      };
    };
  };
}
