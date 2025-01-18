# Dockerfile
FROM golang:1.21 AS backend-builder
WORKDIR /app
COPY backend .
RUN go build -o main .

FROM node:18 AS frontend-builder
WORKDIR /app
COPY frontend .
RUN npm install && npm run build

FROM ubuntu:22.04
# install zotify before anything else
WORKDIR /app
COPY --from=backend-builder /app/main .
COPY --from=frontend-builder /app/dist ./frontend
CMD ["./main"]
