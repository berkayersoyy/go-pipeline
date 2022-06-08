FROM golang:1.17-alpine

WORKDIR /app
ARG VERSION=dev
# Download necessary Go modules
COPY go.mod ./
RUN go mod download

COPY . ./

RUN go build -o /go-pipeline -ldflags=-X=main.version=${VERSION} main.go

EXPOSE 8080

CMD [ "/go-pipeline" ]