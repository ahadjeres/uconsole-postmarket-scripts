#!/bin/bash

# Set CPU governor to 'performance' for 4 CPUs
echo "Setting CPU governor to 'performance' for all 4 CPUs..."

for cpu in /sys/devices/system/cpu/cpu[0-3]; do
    governor_path="$cpu/cpufreq/scaling_governor"
    if [ -f "$governor_path" ]; then
        echo "performance" | sudo tee "$governor_path" > /dev/null
    fi
done

echo "Governor set. Reading back values for verification..."

# Read back and display the governor values for each CPU
for cpu in /sys/devices/system/cpu/cpu[0-3]; do
    governor_path="$cpu/cpufreq/scaling_governor"
    if [ -f "$governor_path" ]; then
        echo "$cpu governor: $(cat $governor_path)"
    fi
done

