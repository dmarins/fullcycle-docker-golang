FROM golang:1.19-alpine3.18 as build-stage
WORKDIR /app
COPY go.mod .
COPY main.go .
RUN go build -o ./fullcycle

FROM scratch
WORKDIR /app
COPY --from=build-stage /app .
CMD ["./fullcycle"]