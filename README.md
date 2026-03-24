# Niri Bluebuild image &nbsp; [![bluebuild build badge](https://github.com/An-Eagle/niri-bluebuild/actions/workflows/build.yml/badge.svg)](https://github.com/An-Eagle/niri-bluebuild/actions/workflows/build.yml)

## Installation

> [!WARNING]  
> [This is an experimental feature](https://www.fedoraproject.org/wiki/Changes/OstreeNativeContainerStable), try at your own discretion.

To rebase an existing atomic Fedora installation to the latest build:

- First rebase to the unsigned image, to get the proper signing keys and policies installed:
  ```
  rpm-ostree rebase ostree-unverified-registry:ghcr.io/an-eagle/niri-bluebuild:latest
  ```
- Reboot to complete the rebase:
  ```
  systemctl reboot
  ```
- Then rebase to the signed image, like so:
  ```
  rpm-ostree rebase ostree-image-signed:docker://ghcr.io/an-eagle/niri-bluebuild:latest
  ```
- Reboot again to complete the installation
  ```
  systemctl reboot
  ```
- This can break some systems, but can also be essential to power management. You can try this out and rollback with rpm-ostree rollback if necessary :
  ```
  rpm-ostree kargs --append='pcie_aspm=force'
  ```




The `latest` tag will automatically point to the latest build. That build will still always use the Fedora version specified in `recipe.yml`, so you won't get accidentally updated to the next major version.

## ISO
!!!!BROKEN!!!!
If build on Fedora Atomic, you can generate an offline ISO with the instructions available [here](https://blue-build.org/learn/universal-blue/#fresh-install-from-an-iso). These ISOs cannot unfortunately be distributed on GitHub for free due to large sizes, so for public projects something else has to be used for hosting.

## Verification

These images are signed with [Sigstore](https://www.sigstore.dev/)'s [cosign](https://github.com/sigstore/cosign). You can verify the signature by downloading the `cosign.pub` file from this repo and running the following command:

```bash
cosign verify --key cosign.pub ghcr.io/an-eagle/niri-bluebuild
```


## Post-Installation

This image provides an unconfigured Dank Material Shell and Niri, by default, but you can load some opinionated configurations from skel :
Load Environment variables for DankMaterialShell (Highly recommended):
```
cp /etc/skel/.config/environment.d/90-dms.conf ~/.config/environment.d/90-dms.conf
```
Load all the configuration files :
```
cp /etc/skel/.config/ ~/.config/
```
Remember to reboot :
```
systemctl reboot
```
