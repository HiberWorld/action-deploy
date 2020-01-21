FROM alpine:3.11

RUN apk -v --update add \
        python \
        py-pip \
        groff \
        curl \
        less \
        mailcap \
        && \
    pip install --upgrade awscli==1.17.6 s3cmd==2.0.1 python-magic && \
    apk -v --purge del py-pip && \
    rm /var/cache/apk/*

RUN curl -sSL -o /usr/local/bin/argocd https://github.com/argoproj/argo-cd/releases/download/v1.4.0/argocd-linux-amd64
RUN chmod +x /usr/local/bin/argocd

# RUN curl -sSL -o /usr/local/bin/kubectl https://amazon-eks.s3-us-west-2.amazonaws.com/1.14.6/2019-08-22/bin/linux/amd64/kubectl
# RUN chmod +x /usr/local/bin/kubectl

# docker run -it --env-file .env hbr-deploy