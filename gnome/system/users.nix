{ config, pkgs, ... }:

{   
    # Define a user account. Don"t forget to set a password with ‘passwd’.
    users.users.zatfer = {
        isNormalUser = true;
        description = "Matteo Ferrini";
        extraGroups = [
            "networkmanager"
            "wheel"
        ];
        packages = with pkgs; [
            # thunderbird
        ];
    };
}
