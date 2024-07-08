FROM ghcr.io/ublue-os/kinoite-nvidia:latest

## Packages to Install
RUN rpm-ostree install dnf-plugins-core docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
RUN rpm-ostree install vivaldi-stable

## Packages to Remove
RUN rpm-ostree override remove

## Files to Copy
COPY etc /etc
COPY usr /usr

## Services to Enable
RUN systemctl enable docker

## Final Steps
RUN ostree container commit
