FROM gitpod/workspace-full

# kubectl
RUN curl -LO https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl \
    && chmod +x kubectl \
    && mv kubectl /usr/local/bin/

# kind
RUN curl -Lo /usr/local/bin/kind https://kind.sigs.k8s.io/dl/latest/kind-linux-amd64 \
    && chmod +x /usr/local/bin/kind

# terraform
RUN apt-get update && apt-get install -y gnupg software-properties-common \
    && wget -O- https://apt.releases.hashicorp.com/gpg | gpg --dearmor \
       | tee /usr/share/keyrings/hashicorp-archive-keyring.gpg \
    && echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] \
       https://apt.releases.hashicorp.com $(lsb_release -cs) main" \
       | tee /etc/apt/sources.list.d/hashicorp.list \
    && apt-get update && apt-get install -y terraform
