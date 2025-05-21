# OpenBSD Networking & SSL Setup Tutorial 🚀

This tutorial covers the essentials for verifying network connectivity, DNS resolution, and managing root SSL certificates on your OpenBSD VM. It is designed for beginners with step-by-step commands and explanations.

---

## Step 1 – Verify Network Connectivity

1. **Show network interface and IP address**

   ```sh
   ifconfig em0
   ```

   Confirm you see a valid IPv4 or IPv6 address under `em0`.

2. **Test basic IP connectivity**

   ```sh
   ping -c 4 8.8.8.8
   ```

   Successful replies indicate the VM’s network and VMware host are configured correctly.

3. **Test DNS resolution**

   ```sh
   ping -c 4 openbsd.org
   ```

   If you receive replies, DNS lookups are working.

4. **Check resolver configuration**

   ```sh
   cat /etc/resolv.conf
   ```

   You should see at least one `nameserver x.x.x.x` entry.

5. **Optional: Trace network path**

   ```sh
   traceroute openbsd.org
   ```

   Displays each hop from your VM to the destination.

---

## Step 2 – SSL Certificate Bundle on OpenBSD 7.7

### Why `ca_root_nss` is missing in 7.7/amd64 packages

* The `ca_root_nss` package is no longer shipped separately for OpenBSD 7.7 on amd64.
* Root certificates are provided by default in the base system under `/etc/ssl/cert.pem`.

### Confirm bundled CA certificates

1. **Check `cert.pem` exists**

   ```sh
   ls -l /etc/ssl/cert.pem
   ```

   You should see the file. It contains concatenated root CAs.

2. **Test HTTPS connectivity**

   ```sh
   curl -I https://www.openbsd.org/
   ```

   Should return `HTTP/1.1 200 OK` if certificates are valid.

### Adding a custom CA certificate (if needed)

If you have an internal CA to trust:

```sh
doas sh -c 'cat /path/to/mon-ca-interne.pem >> /etc/ssl/cert.pem'
```

Then retest:

```sh
curl -I https://internal.example.local/
```

---

## Summary

* Verified network setup with `ifconfig`, `ping`, and DNS checks.
* Root SSL bundle is built into `/etc/ssl/cert.pem` on OpenBSD 7.7—no separate `ca_root_nss` package.
* Custom CAs can be appended to `/etc/ssl/cert.pem` as needed.

Feel free to include these commands and explanations in your documentation for a complete and beginner-friendly guide! 🚀
