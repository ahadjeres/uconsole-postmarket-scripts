#!/bin/bash

# Define the values you want to add
config_file="/boot/config.txt"
over_voltage="over_voltage=6"
arm_freq="arm_freq=2147"
gpu_freq="gpu_freq=750"

# Check if the values are already present
if grep -q "$over_voltage" "$config_file" && grep -q "$arm_freq" "$config_file" && grep -q "$gpu_freq" "$config_file"; then
    echo "Configuration already exists in $config_file."
else
    # Use sudo to append the values to the config file
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

