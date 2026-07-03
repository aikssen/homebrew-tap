# homebrew-tap

Homebrew tap for [**hlab**](https://github.com/aikssen/hlab) — one CLI for your entire
homelab (Terraform + Ansible + Proxmox, orchestrated into one workflow).

## Install

```bash
brew install aikssen/tap/hlab
```

That auto-taps this repo and installs the latest release binary for your OS/arch
(macOS and Linux, amd64 and arm64), verified against the release `SHA256SUMS`.

To update:

```bash
brew upgrade hlab
```

## Formulae

| Formula | Description |
|---------|-------------|
| `hlab`  | Create and manage Proxmox VMs and LXC containers from a single CLI + dashboard TUI. |

## Notes

hlab drives Terraform and Ansible at runtime. Install them separately if needed:

```bash
brew install ansible
brew install hashicorp/tap/terraform
```

See the [hlab repository](https://github.com/aikssen/hlab) for full documentation.
