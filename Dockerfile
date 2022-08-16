FROM registry.access.redhat.com/ubi8/go-toolset:1.16.12 as builder
ENV GOPATH=$APP_ROOT
COPY --chown=1001:0 . .
RUN make cmd

FROM registry.access.redhat.com/ubi8/ubi-minimal
USER root
RUN microdnf -y install \
  wget \
  git \
  subversion \
  sqlite \
 && microdnf -y clean all
 WORKDIR /working
 COPY --from=builder /opt/app-root/src/bin/addon /usr/local/bin/addon
 ENTRYPOINT ["/usr/local/bin/addon"]
