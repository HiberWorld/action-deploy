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