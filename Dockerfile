FROM golang:1.17.8 AS build

WORKDIR /usr/src/app
COPY ./main.go ./
RUN go build main.go

FROM scratch
COPY --from=build /usr/src/app/main /

ENTRYPOINT [ "./main" ]
