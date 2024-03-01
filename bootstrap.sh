#!/usr/bin/env bash

# enable community repos
sed -i 's/bookworm/testing/g' /etc/apt/sources.list
apt update

# install pkgs
apt install -y \
    git \
    build-essential \
    stow \
    fish \
    tmux \
    htop \
    bat \
    ripgrep \
    fzf \
    fd-find \
    curl \
    jq \
    podman \
    docker-compose \
    qemu-user-static

# nodejs 20
curl -fsSL https://deb.nodesource.com/setup_20.x | bash -
apt install -y nodejs

# fix file watcher limit
echo fs.inotify.max_user_watches= 131070 | tee -a /etc/sysctl.conf
sysctl -p

# go
wget https://go.dev/dl/go1.22.0.linux-arm64.tar.gz
rm -rf /usr/local/go && tar -C /usr/local -xzf go1.22.0.linux-arm64.tar.gz && rm go1.22.0.linux-arm64.tar.gz
PATH="$PATH:/usr/local/go/bin"

# neovim
git clone -b stable --single-branch --depth 1 https://github.com/neovim/neovim.git
apt install -y \
    ninja-build \
    gettext \
    cmake \
    unzip
cd neovim && make CMAKE_BUILD_TYPE=RelWithDebInfo
make install

apt autoremove

read -p "username: " username
chsh -s $(which fish) $username

# update ssh config
echo ""
echo ""
echo "Updating ssh config"

# ssh_port=$((10000 + RANDOM%(1+19999-10000)))
tee -a /etc/ssh/sshd_config > /dev/null <<EOF
PermitRootLogin no
PasswordAuthentication yes
PermitEmptyPasswords no
UseDNS no
EOF

echo ""
echo ""
echo "Restarting sshd"
systemctl restart sshd

echo ""
echo ""
echo "now copy over your ssh key with ssh-copy-id"
done=""
echo "checking if file exists /home/$username/.ssh/authorized_keys";
while [ -z "$done" ]; do
    if [ -f "/home/$username/.ssh/authorized_keys" ]; then
        done="yes"
        break;
    fi
    printf "."
    sleep 3;
done

echo ""
echo ""
echo "ssh key installed, will disable ssh password login"
sed -i "s/PasswordAuthentication no/PasswordAuthentication yes/g" /etc/ssh/sshd_config
systemctl restart sshd

echo ""
echo ""
echo "Setup config files for $username"
cd /home/$username
su -s $(which sh) $username <<EOF
git clone https://github.com/gassiss/dotfiles .dotfiles
cd .dotfiles

stow fish
ln -s /usr/share/doc/fzf/examples/key-bindings.fish /home/$username/.config/fish/functions/fzf_key_bindings.fish
stow git
stow nvim
stow tmux

echo "installing LSPs"
npm config set prefix /home/$username/.local/npm
npm install -g typescript typescript-language-server vscode-langservers-extracted
go install golang.org/x/tools/gopls@latest github.com/grafana/jsonnet-language-server@latest

tee -a /home/$username/.ssh/config > /dev/null <<EOL
Host *
    AddKeysToAgent yes
EOL

# shut up welcome message on login
touch /home/$username/.hushlogin
fish -c "set -U fish_greeting ''"
EOF

