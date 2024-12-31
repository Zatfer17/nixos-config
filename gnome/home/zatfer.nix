{ config, pkgs, ... }:

{   
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
                edge-tiling = true;
                center-new-windows = true;
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
                switch-windows = [];
                switch-windows-backward = [];
                cycle-windows = ["<Alt>Tab"];
                cycle-windows-backward = ["<Shift><Alt>Tab"];
                cycle-group = ["<Control>Tab"];
                cycle-group-backward = ["<Shift><Control>Tab"];
                switch-group = [];
                switch-group-backward = [];

                focus-active-notification = [];
                toggle-quick-settings = [];
                restore-shortcuts = [];
                toggle-application-view = ["<Super>space"];
                toggle-message-tray = ["<Super>v"];
                toggle-overview = [];
                panel-run-dialog = [];

                switch-input-source = [];
                switch-input-source-backward = [];

                activate-window-menu = ["<Alt>space"];
                close = ["<Super>q"];
                minimize = [];
                lower = [];
                maximize = ["<Super>Up"];
                maximize-horizontally = [];
                maximize-vertically = [];
                begin-move = [];
                raise = [];
                raise-or-lower = [];
                begin-resize = ["<Super>r"];
                unmaximize = ["<Super>Down"];
                toggle-fullscreen = ["<Super>f"];
                toggle-maximized = [];
                toggle-on-all-workspaces = [];
                toggle-tiled-left = ["<Super>Left"];
                toggle-tiled-right = ["<Super>Right"];
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
                www = ["<Super>c"];
                search = [];
                control-center = ["<Super>s"];

                screensaver = ["<Super>Escape"];
                logout = [];

                custom-keybindings = ["/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/"];
            };
            "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0" = {
                binding = "<Super>Return";
                command = "kgx";
                name = "Launch console";
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
                col-0 = 2;
                col-1 = 1;
                col-2 = 1;
                col-3 = 1;
                row-0 = 1;
                row-1 = 1;
                row-2 = 0;

                layout-2-col-0 = 2;
                layout-2-col-1 = 1;
                layout-2-col-2 = 1;
                layout-2-col-3 = 1;
                layout-2-row-0 = 1;
                layout-2-row-1 = 1;
                layout-2-row-2 = 0;

                gap-size = 16;
            };
        };
    };
}
