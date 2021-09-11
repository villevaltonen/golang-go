FROM golang:1.15.6-alpine

# setup directories
RUN mkdir /app
ADD . /app
WORKDIR /app

## pull dependencies
RUN go mod download

## build app
RUN go build -o main .

## add a non-root user
RUN adduser --disabled-password -u 1000 user
USER user

## start application
CMD ["/app/main"]