FROM golang:1.19-alpine3.18 as build-stage
WORKDIR /app/src
COPY go.mod .
COPY main.go .
RUN go build -o ../bin/fullcycle

FROM scratch
WORKDIR /app
COPY --from=build-stage /app/bin .
CMD ["/app/fullcycle"]