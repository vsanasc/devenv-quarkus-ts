FROM debian:bookworm-slim

ARG HOST_UID=1000
ARG HOST_GID=1000

RUN apt-get update && apt-get install -y \
    ca-certificates curl gnupg lsb-release \
 && install -m 0755 -d /etc/apt/keyrings \
 && curl -fsSL https://download.docker.com/linux/debian/gpg -o /etc/apt/keyrings/docker.asc \
 && chmod a+r /etc/apt/keyrings/docker.asc \
 && echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/debian $(. /etc/os-release && echo $VERSION_CODENAME) stable" \
    > /etc/apt/sources.list.d/docker.list

RUN curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.tar.gz \
    && rm -rf /opt/nvim-linux-x86_64 \
    && tar -C /opt -xzf nvim-linux-x86_64.tar.gz \
    && rm -rf nvim-linux-x86_64.tar.gz

RUN apt-get update \
 && apt-get install -y curl git jq tmux zsh sudo ca-certificates docker.io docker-compose-plugin tree ripgrep fzf fd-find bat luarocks \
 && rm -rf /var/lib/apt/lists/*

RUN groupadd -g ${HOST_GID} dev && \
    useradd -m -u ${HOST_UID} -g ${HOST_GID} dev \
    && echo "dev ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/dev

USER dev

WORKDIR /home/dev

RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" || true

RUN mkdir -p .config/nvim

ADD .tmux.conf .

ADD .zshrc .

ADD ./nvim .config/nvim

RUN git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

RUN git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm && ~/.tmux/plugins/tpm/bin/install_plugins

RUN curl -s "https://get.sdkman.io?ci=true&rcupdate=false" | bash

RUN zsh -c "source .sdkman/bin/sdkman-init.sh \
      && sdk version \
      && sdk install java 21.0.8-tem"

RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash

RUN zsh -c '\. "$HOME/.nvm/nvm.sh" \
    && nvm install 22 \
    && node -v \ 
    && npm -v'

RUN zsh -c "source ~/.zshrc && nvim --headless '+Lazy! install' \
    '+lua require(\"lazy\").load({ plugins = { \"nvim-treesitter\" } }); require(\"nvim-treesitter.install\").update({ with_sync = true })()' \
    '+Lazy! build' +qa"

SHELL ["/usr/bin/zsh", "-lc"]


