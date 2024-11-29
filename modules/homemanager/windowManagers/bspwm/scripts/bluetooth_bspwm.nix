{pkgs, ...}: let
  bluetooth_bspwm = pkgs.writeShellScriptBin "bluetooth_bspwm" ''
    POWER_ON="#a1efd3"
    POWER_OFF="#F8F8F8"

    # Checks if bluetooth controller is powered on
    power_on() {
        if ${pkgs.bluez}/bin/bluetoothctl show | grep -q "Powered: yes"; then
            return 0
        else
            return 1
        fi
    }

    # Checks if a device is connected
    device_connected() {
        device_info=$(${pkgs.bluez}/bin/bluetoothctl info "$1")
        if echo "$device_info" | grep -q "Connected: yes"; then
            return 0
        else
            return 1
        fi
    }

    # Prints a short string with the current bluetooth status
    # Useful for status bars like polybar, etc.
    print_status() {
        if power_on; then
    		if [[ -z `${pkgs.bluez}/bin/bluetoothctl info "$device" | grep "Alias" | cut -d ' ' -f 2-` ]]; then
    			echo "%{F$POWER_ON}%{T2}%{T-} %{F-}On"
    		fi

            paired_devices_cmd="devices Paired"
            # Check if an outdated version of bluetoothctl is used to preserve backwards compatibility
            #if (( $(echo "$(bluetoothctl version | cut -d ' ' -f 2) < 5.65" | bc -l) )); then
            #    paired_devices_cmd="paired-devices"
            #fi

            mapfile -t paired_devices < <(${pkgs.bluez}/bin/bluetoothctl $paired_devices_cmd | grep Device | cut -d ' ' -f 2)
            counter=0

            for device in "''${paired_devices[@]}"; do
                if device_connected "$device"; then
                    device_alias=$(${pkgs.bluez}/bin/bluetoothctl info "$device" | grep "Alias" | cut -d ' ' -f 2-)

                    if [ $counter -gt 0 ]; then
                        echo "%{F$POWER_ON}%{T2}%{T-} %{F-}$device_alias"
                    else
                        echo "%{F$POWER_ON}%{T2}%{T-} %{F-}$device_alias"
                    fi

                    ((counter++))
                fi
            done
        else
            echo "%{F$POWER_OFF}%{T2}%{T-} Off%{F-}"
        fi
    }

    # Print Status
    print_status
  '';
in {
  home.packages = with pkgs; [
    bluetooth_bspwm
  ];
}
