FROM ubuntu

LABEL maintainer="robin@kearney.co.uk"

RUN apt-get update -y && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y \
    apt-transport-https \
    curl \
    dnsutils \
    git \
    gpg \
    htop \
    jq \
    lsof \
    netcat-traditional \
    nmap \
    pipx \
    postgresql-client \
    python3 python3-pip \
    ssh \
    tcpflow \
    vim \
    yq && \
    echo 'export PATH="$PATH:/root/.local/bin"' | tee -a /root/.bashrc && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN pipx install awscli && \
    rm -rf /root/.cache/pipx

RUN curl -fsSL https://packages.buildkite.com/helm-linux/helm-debian/gpgkey | gpg --dearmor | tee /usr/share/keyrings/helm.gpg > /dev/null && \
    echo "deb [signed-by=/usr/share/keyrings/helm.gpg] https://packages.buildkite.com/helm-linux/helm-debian/any/ any main" | tee /etc/apt/sources.list.d/helm-stable-debian.list && \
    apt-get update -y && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y helm && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | gpg --dearmor -o /usr/share/keyrings/cloud.google.gpg && \
    echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] https://packages.cloud.google.com/apt cloud-sdk main" | tee -a /etc/apt/sources.list.d/google-cloud-sdk.list && \
    apt-get update -y && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y google-cloud-cli && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN apt-get autoremove -y && \
    rm -rf /tmp/* && \
    rm -rf /var/tmp/* && \
    rm -rf /root/.cache/pip
