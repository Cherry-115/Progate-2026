FROM ubuntu:latest

RUN apt update \
&& apt install -y curl wget unzip tar git zsh sudo

RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-aarch64.zip" -o "/tmp/awscliv2.zip" \
&& unzip /tmp/awscliv2.zip -d /tmp/ \
&& /tmp/aws/install \
&& rm -rf /tmp/awscliv2.zip

RUN wget -O "/tmp/awssam.zip" "https://github.com/aws/aws-sam-cli/releases/latest/download/aws-sam-cli-linux-arm64.zip" \
&& unzip /tmp/awssam.zip -d /tmp/sam-installation \
&& /tmp/sam-installation/install \
&& rm -rf /tmp/awssam.zip \
&& rm -rf /tmp/sam-installation

RUN curl --output /tmp/localstack-cli-4.14.0-linux-arm64-onefile.tar.gz \
    --location https://github.com/localstack/localstack-cli/releases/download/v4.14.0/localstack-cli-4.14.0-linux-arm64-onefile.tar.gz \
&& tar xvzf /tmp/localstack-cli-4.14.0-linux-*-onefile.tar.gz -C /usr/local/bin \
&& rm -rf /tmp/localstack-cli-4.14.0-linux-*-onefile.tar.gz

RUN  rm -rf /usr/local/go && wget -O "/tmp/go1.26.1.linux-arm64.tar.gz" https://go.dev/dl/go1.26.1.linux-arm64.tar.gz && tar -C /usr/local -xzf /tmp/go1.26.1.linux-arm64.tar.gz && export PATH=$PATH:/usr/local/go/bin

# specify the Oh My Zsh version string
ARG OMZ_VERSION=master

# install ohmyzsh
RUN BRANCH=${OMZ_VERSION} \
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/${OMZ_VERSION}/tools/install.sh)" "" \
    --unattended

