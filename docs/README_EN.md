# Installing OpenBSD on VMware Workstation Pro 17 🚀

This guide is designed for beginners and explains step by step how to create and configure an OpenBSD virtual machine. This setup is ideal for starting advanced networking projects, potentially including eBPF, network monitoring, security, and analysis. Each step is clearly and methodically described so everyone can successfully complete the installation.

For an overview of the project's long-term vision and upcoming modules, see [VISION.md](VISION.md).

---

## Prerequisites

To get started, make sure you have:

* VMware Workstation Pro 17 installed
* The OpenBSD ISO file (e.g., `install73.iso`) downloaded from [openbsd.org](https://www.openbsd.org/)
* A processor with virtualization enabled (VT-x/AMD-V)
* At least 4 GB of RAM available
* A stable network connection, ideally in Bridged mode

---

## Step 1 – Create the Virtual Machine

1. Open VMware Workstation Pro 17.
2. Click **File** → **New Virtual Machine**, then choose **Custom (Advanced)**.
3. Select the latest available Hardware Compatibility.
4. Choose **I will install the operating system later**.
5. Select **Other → OpenBSD 64-bit** as the guest OS.
6. Name your VM, e.g., `openbsd-lab`.
7. Allocate 1 CPU with 2 cores (adjustable later).
8. Assign at least 4096 MB (4 GB) of RAM.
9. Set the network adapter to **Bridged**.

   * Optionally, add a second adapter (NAT or Host-Only).
10. Choose **LSI Logic** as the I/O controller.
11. Configure the virtual disk:

    * Type: SCSI
    * Size: 10–20 GB minimum
    * Format: VMDK

---

## Step 2 – Install OpenBSD

1. Power on the new VM.
2. Select the `install73.iso` ISO when prompted.
3. Follow the installer with these recommendations:

* **Keyboard layout**: `fr` (French) or `us` (English)
* **Hostname**: `openbsd-lab`
* **Network interface**: `em0` with DHCP enabled (or manual IP)
* **Root password**: strong (≥ 8 characters, mix letters, numbers, symbols)
* **User**: create `admin`
* **Groups**: add `admin` to `wheel` (needed for `doas`)
* **Sets**: install all except `games` and sets starting with `x*`
* **Sets source**: HTTP (automatic mirror)
* **Partitioning**: use **Auto layout**, or custom:

  * Separate `/home`
  * `/tmp` and `/var` with `nosuid,nodev`
  * `/usr` large enough for tools

---

## Step 3 – Basic Post-Installation Setup

### Configure `doas`

Log in as root and run:

```
sh -c 'echo "permit persist keepenv :wheel" > /etc/doas.conf'
```

### Add `admin` to `wheel`

```
usermod -G wheel admin
id admin
```

### Verify

```
su - admin
doas ls /
```

### Update system

```
syspatch
pkg_add mozilla-rootcerts
mozilla-rootcerts install
```

---

## Step 4 – Simple PF Firewall Configuration

### Create `/etc/pf.conf`

```
vi /etc/pf.conf
```

Insert:

```
# Minimal PF configuration
set skip on lo0

block in all
pass out all keep state
```

Save and exit: `ESC`, then `:wq` + Enter.

### Enable PF

```
doas rcctl enable pf
doas pfctl -f /etc/pf.conf
doas pfctl -e
doas pfctl -s info
```

You should see: `Status: Enabled`.

---

Congratulations! Your OpenBSD VM is now ready to use. This README provides a solid foundation for beginners. Additional guides will be available soon for advanced setups like eBPF, analysis tools, IDS, and sandboxing.

Contributions and feedback are welcome! 🚀

## License

This project is released under the MIT License. See the [LICENSE](../LICENSE) file for details.
