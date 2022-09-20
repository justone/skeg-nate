FROM skegio/clojure:java11

# Holen
RUN wget https://github.com/holen-app/holen/releases/download/v0.3.0/holen_linux_amd64 -O /usr/local/bin/holen && \
    chmod a+x /usr/local/bin/holen

# Vim 8.x
RUN add-apt-repository ppa:jonathonf/vim && \
    apt-get update && apt-get install -y vim-nox

# Neovim
RUN wget https://github.com/neovim/neovim/releases/download/v0.7.2/nvim-linux64.deb && \
    dpkg -i nvim-linux64.deb && \
    rm nvim-linux64.deb && \
    apt-get update && \
    apt-get install -y python3-dev python3-pip python3-venv && \
    pip3 install neovim

# need visualvm
RUN apt update && apt install -y visualvm

# node and yarn
RUN curl -fsSL https://deb.nodesource.com/setup_18.x | bash - && \
    apt-get update && \
    apt-get install -y nodejs yarn

# other apps
RUN apt-get update && \
    apt-get install -y rsync graphviz bc telnet whois dnsutils netcat-openbsd iproute2 unzip libssl-dev && \
    npm install -g underscore-cli

ADD build-git-crypt.sh build-git-crypt.sh
RUN chmod +x build-git-crypt.sh && ./build-git-crypt.sh && rm build-git-crypt.sh

ADD ssh-tweaks.sh ssh-tweaks.sh
RUN chmod +x ssh-tweaks.sh && ./ssh-tweaks.sh && rm ssh-tweaks.sh
