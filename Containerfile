FROM quay.io/fedora/fedora-bootc:42
RUN dnf5 -y install 'dnf5-command(config-manager)'
RUN dnf5 -y config-manager addrepo --from-repofile='https://pkgs.tailscale.com/stable/fedora/tailscale.repo'
RUN dnf5 -y install --allowerasing \
    tailscale \
    vim-default-editor \
    tmux \
    fish \
    bash-completion \
    bash-color-prompt \
    git \
    gh \
    cockpit \
    cockpit-files \
    cockpit-kdump \
    cockpit-networkmanager \
    cockpit-ostree \
    cockpit-podman \
    cockpit-selinux \
    cockpit-session-recording \
    cockpit-sosreport \
    cockpit-storaged \
    fwupd \
    gnupg2 \
    firewalld \
    tuned \
    podman \
    pcp \
    python3-pcp \
    valkey \
    nfs-utils
RUN dnf5 clean all
RUN firewall-offline-cmd --add-service=ssh --permanent && \
    firewall-offline-cmd --add-service=mdns --permanent && \
    firewall-offline-cmd --add-service=dhcpv6-client --permanent && \
    firewall-offline-cmd --add-service=cockpit --permanent && \
    firewall-offline-cmd --add-service=pmproxy --permanent
RUN systemctl enable \
    tailscaled.service \
    sshd.service \
    cockpit.socket \
    podman-restart.service \
    podman-auto-update.timer \
    firewalld.service \
    podman.socket \
    pmlogger.service \
    pmproxy.service \
    NetworkManager.service
RUN bootc container lint
