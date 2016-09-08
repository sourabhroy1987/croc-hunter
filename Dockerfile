FROM golang:1.6-alpine

MAINTAINER Lachlan Evenson <lachlan.evenson@gmail.com>

ARG VCS_REF
ARG BUILD_DATE

# Metadata
LABEL org.label-schema.vcs-ref=$VCS_REF \
      org.label-schema.vcs-url="https://github.com/lachie83/croc-hunter" \
      org.label-schema.build-date=$BUILD_DATE \
      org.label-schema.docker.dockerfile="/Dockerfile"

COPY . /go/src/github.com/lachie83/croc-hunter
COPY static/ static/

ENV GOPATH /go
RUN cd $GOPATH/src/github.com/lachie83/croc-hunter && go install -v .

CMD ["croc-hunter"]

EXPOSE 8080
	
