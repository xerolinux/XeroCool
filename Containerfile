FROM ghcr.io/ublue-os/kinoite-nvidia:latest

## Packages to Install
RUN rpm-ostree install vivaldi-stable bat fastfetch eza wget git dialog yaml-cpp gtk-update-icon-cache piper inxi
RUN rpm-ostree install dnf-plugins-core docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
RUN rpm-ostree install qemu qemu-user-static qemu-user-binfmt virt-manager libvirt qemu qemu-user-static qemu-user-binfmt edk2-ovmf
RUN rpm-ostree install git-extras f39-backgrounds-extras-kde fira-code-fonts alerque-libertinus-fonts source-foundry-hack-fonts jetbrains-mono-fonts
RUN rpm-ostree install kvantum gtk-murrine-engine gtk2-engines gnome-themes-extra xmlstarlet unzip jq google-noto-emoji-color-fonts meld tree btop unrar unzip
RUN rpm-ostree install p7zip hwinfo nodejs hddtemp gnome-disk-utility dconf-editor yad filezilla hardinfo2 timeshift wine wine-mono wineglass winetricks mpv kdenlive

## Packages to Remove (If any)
RUN rpm-ostree override remove

## Files to Copy
COPY etc /etc
COPY usr /usr

## Services to Enable
RUN systemctl enable docker

## Final Steps
RUN ostree container commit
