VERSION ?= 0.1.0
CACHE ?= --no-cache=1
FULLVERSION ?= ${VERSION}
archs ?= amd64 arm32v6 i386

.PHONY: all build publish latest
all: build publish latest
qemu-arm-static:
	cp /usr/bin/qemu-arm-static .
qemu-aarch64-static:
	cp /usr/bin/qemu-aarch64-static .
build: qemu-aarch64-static qemu-arm-static
	$(foreach arch,$(archs), \
		cat Dockerfile | sed "s/FROM alpine/FROM ${arch}\/alpine/g" | sed "s/FROM golang/FROM ${arch}\/golang/g" > .Dockerfile; \
		docker build -t jaymoulin/sshtron:${VERSION}-$(arch) -f .Dockerfile ${CACHE} .;\
	)
publish:
	docker push jaymoulin/sshtron
	cat manifest.yml | sed "s/\$$VERSION/${VERSION}/g" > manifest.yaml
	cat manifest.yaml | sed "s/\$$FULLVERSION/${FULLVERSION}/g" > manifest2.yaml
	mv manifest2.yaml manifest.yaml
	manifest-tool push from-spec manifest.yaml
latest: build
	FULLVERSION=latest VERSION=${VERSION} make publish
