# tui-vfio-launcher

**tui-vfio-launcher** is a terminal-based utility for Debian 12 “Bookworm” that streamlines GPU passthrough configuration with VFIO and libvirt, and includes seamless integration with Looking Glass for low-latency VM display. Its guided text UI leads you step by step from IOMMU setup through to Windows VM launch.

## Requirements

* Host OS: Debian 12 “Bookworm”
* GPU with passthrough capability
* CPU with IOMMU support (Intel VT-d or AMD-Vi)
* Familiarity with the Linux command line and virtualization fundamentals
* Root (sudo) privileges for installation and configuration
* NVIDIA GPUs are currently the only officially supported hardware

## Features

* **IOMMU Configuration**
  Automatically configures the required kernel parameters in GRUB
* **VFIO Provisioning**
  Installs and binds VFIO drivers for GPU passthrough
* **Libvirt Integration**
  Creates and manages libvirt VM definitions, including Looking Glass setup
* **Text-Based User Interface**
  Provides an intuitive, curses-style workflow for every configuration step
* **Robust Error Handling**
  Outputs clear, actionable error messages and troubleshooting tips
* **Extensive Documentation**
  Offers detailed explanations of each stage and customizable options
