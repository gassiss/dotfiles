#!/usr/bin/env sh

read -p "name this bad boy: " hostname

# disable motd (that welcome message when you log in)
echo "" > /etc/motd

# enable community repos
sed -i 's/#http/http/' /etc/apk/repositories
# install dev pkgs
apk add \
    git \
    git-doc \
    build-base \
    stow \
    stow-doc \
    bash \
    bash-doc \
    fish \
    fish-doc \
    tmux \
    tmux-doc \
    htop \
    ripgrep \
    ripgrep-doc \
    fd \
    fd-doc \
    curl \
    curl-doc \
    jq \
    jq-doc \
    podman \
    podman-doc \
    docker-compose \
    nodejs \
    nodejs-doc \
    npm \
    npm-doc \
    go \
    go-doc \
    man-pages \
    mandoc \
    fzf \
    fzf-doc \
    fzf-fish-plugin \
    neovim \
    neovim-doc

rc-update add cgroups
rc-service cgroups start

# create user
echo ""
read -p "username: " username
adduser -s $(which fish) $username

ip=$(ip route get 192.168.0.1 | awk '{print $7}')

# update ssh config
echo ""
echo ""
echo "Updating ssh config"

ssh_port=$((10000 + RANDOM%(1+19999-10000)))
tee -a /etc/ssh/sshd_config > /dev/null <<EOF
Port $ssh_port
PermitRootLogin no
PasswordAuthentication yes
PermitEmptyPasswords no
UseDNS no
EOF

echo ""
echo ""
echo "Restarting sshd"
rc-service sshd restart

echo "add this to your .ssh/config"
cat <<EOF
Host $hostname
    Hostname $ip
    User $username
    LogLevel Fatal
    Port $ssh_port
EOF

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
rc-service sshd restart

echo ""
echo ""
echo "Setup config files for $username"
cd /home/$username
su -s $(which sh) $username <<EOF
git clone https://github.com/gassiss/dotfiles .dotfiles
cd .dotfiles

stow fish
stow git
stow nvim
stow tmux

echo "installing LSPs"
npm config set prefix /home/$username/.local/npm
npm install -g typescript typescript-language-server vscode-langservers-extracted
go install golang.org/x/tools/gopls@latest github.com/grafana/jsonnet-language-server@latest
EOF

