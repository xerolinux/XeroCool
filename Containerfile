FROM ghcr.io/ublue-os/kinoite-nvidia:latest

## Packages to Install
RUN rpm-ostree install vivaldi-stable bat fastfetch
RUN rpm-ostree install dnf-plugins-core docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
RUN rpm-ostree install qemu qemu-user-static qemu-user-binfmt virt-manager libvirt qemu qemu-user-static qemu-user-binfmt edk2-ovmf

## Packages to Remove (If any)
RUN rpm-ostree override remove

## Files to Copy
COPY etc /etc
COPY usr /usr

## Services to Enable
RUN systemctl enable docker

## Final Steps
RUN ostree container commit
