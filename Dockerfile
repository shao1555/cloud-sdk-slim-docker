FROM docker:17.07.0-ce AS docker
FROM google/cloud-sdk:170.0.1-slim
COPY --from=docker /usr/local/bin/docker /usr/local/bin/docker
COPY --from=docker /usr/local/bin/docker-containerd-shim /usr/local/bin/docker-containerd-shim
COPY --from=docker /usr/local/bin/docker-containerd /usr/local/bin/docker-containerd
COPY --from=docker /usr/local/bin/docker-runc /usr/local/bin/docker-runc
COPY --from=docker /usr/local/bin/docker-init /usr/local/bin/docker-init
COPY --from=docker /usr/local/bin/docker-containerd-ctr /usr/local/bin/docker-containerd-ctr
COPY --from=docker /usr/local/bin/docker-proxy /usr/local/bin/docker-proxy
COPY --from=docker /usr/local/bin/dockerd /usr/local/bin/dockerd
RUN apt-get -y install kubectl

