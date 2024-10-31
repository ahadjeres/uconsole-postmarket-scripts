#!/bin/bash

# Check for sudo access
if [ "$EUID" -ne 0 ]; then
    echo "This script requires sudo privileges. Please run it with sudo:"
    echo "sudo $0"
    exit 1
fi

# Define the values you want to add
config_file="/boot/config.txt"
over_voltage="over_voltage=6"
arm_freq="arm_freq=2147"
gpu_freq="gpu_freq=750"

# Check if the values are already present
if grep -q "$over_voltage" "$config_file" && grep -q "$arm_freq" "$config_file" && grep -q "$gpu_freq" "$config_file"; then
    echo "Configuration already exists in $config_file."
else
    # Append the values to the config file with sudo
    echo "Adding configuration to $config_file..."
    {
        echo ""
        echo "# Custom overclock settings"
        echo "$over_voltage"
        echo "$arm_freq"
        echo "$gpu_freq"
    } | sudo tee -a "$config_file" > /dev/null
    echo "Configuration added successfully."
fi
