FROM pangpanglabs/golang:builder AS builder

WORKDIR /go/src/wait
COPY . .
# disable cgo
ENV CGO_ENABLED=0

# make application docker image use alpine
FROM pangpanglabs/alpine-ssl
WORKDIR /go/src/wait

# copy execute file to image
COPY --from=builder /go/src/wait ./

CMD ["./wait"]