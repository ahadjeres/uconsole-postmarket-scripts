# uConsole Scripts for postmarketOS

This repository contains scripts for configuring and optimizing the uConsole device running on postmarketOS. These scripts enable easy adjustments to system performance, overclocking, and CPU settings, tailored specifically for a 4-CPU setup.

## Table of Contents

- [Scripts](#scripts)
  - [set_overclock.sh](#1-set_overclocksh)
  - [set_governor.sh](#2-set_governorsh)
- [Requirements](#requirements)
- [Usage](#usage)
- [Contributing](#contributing)
- [License](#license)

## Scripts

### 1. `set_overclock.sh`

This script modifies `/boot/config.txt` to apply custom overclock settings to enhance device performance. It adds the following parameters to the configuration file:

- `over_voltage=6`
- `arm_freq=2147`
- `gpu_freq=750`

The script checks if these values are already in place to avoid duplicate entries, ensuring a clean configuration.

#### Usage
```bash
chmod +x set_overclock.sh
./set_overclock.sh
```

### 2. `set_governor.sh`

This script sets the CPU governor for all 4 CPUs to "performance" mode, aiming to maintain maximum CPU frequency for improved processing speed. After applying the "performance" setting, the script reads back the governor values to verify the update.

#### Usage
```bash
chmod +x set_governor.sh
./set_governor.sh
```

## Requirements

- **sudo** access is required to modify system settings.
- **postmarketOS** environment, specifically configured for the uConsole device.

## Usage

1. Clone the repository and navigate to the directory.
2. Make the scripts executable:
   ```bash
   chmod +x set_overclock.sh set_governor.sh
   ```
3. Run each script as needed, following the usage instructions provided.

## Contributing

Contributions are welcome! Please submit pull requests or open issues for feature suggestions, bug fixes, or other improvements.

## License

This repository is open-source and licensed under the MIT License.
