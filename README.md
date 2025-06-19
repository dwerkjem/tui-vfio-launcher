# tui-vfio-launcher

A terminal-based utility for Debian 12 that simplifies GPU passthrough setup using VFIO and libvirt, with built-in support for launching Looking Glass for low-latency VM display. Through an intuitive text UI, it guides you step-by-step from IOMMU configuration to Windows VM launch.

## Requirements
- Debian 12 (Bookworm) as the host OS.
- A compatible GPU for passthrough.
- A modern CPU with IOMMU support.
- Basic knowledge of Linux command line and virtualization concepts.
- Root privileges for installation and configuration tasks.
- Currently, the script is designed to work with NVIDIA GPUs for passthrough.

## Features
- **IOMMU Configuration**: Automatically configures IOMMU settings in the GRUB bootloader.
- **VFIO Setup**: Installs necessary packages and configures VFIO for GPU passthrough.
- **Libvirt Integration**: Sets up libvirt for managing VMs and integrates with Looking Glass for low-latency display.
- **User-Friendly UI**: Intuitive text-based interface that guides you through each step.
- **Error Handling**: Provides clear error messages and troubleshooting tips.
- **Documentation**: Comprehensive documentation to help you understand each step of the process.