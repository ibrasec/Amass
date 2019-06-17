FROM golang:alpine as build
WORKDIR /go/src/github.com/ibrasec/Amass
COPY . .
RUN apk --no-cache add git \
  && go get -u github.com/ibrasec/Amass/...

FROM alpine:latest
COPY --from=build /go/bin/amass /bin/amass
COPY --from=build /go/src/github.com/ibrasec/Amass/wordlists /wordlists
ENTRYPOINT ["/bin/amass"]
