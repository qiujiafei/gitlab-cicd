FROM golang AS build-env
ADD . /app
WORKDIR /app
RUN GOOS=linux GOARCH=386 go build -o gohttp main.go

FROM alpine
COPY --from=build-env /app/gohttp /usr/local/bin/gohttp
EXPOSE 9090
CMD [ "gohttp" ]