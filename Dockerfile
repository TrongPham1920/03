FROM golang:1.23.2-alpine3.20

# Cài đặt bash và curl để kiểm tra dễ dàng hơn
RUN apk update && apk add --no-cache bash curl

WORKDIR /app

# Sao chép go.mod và go.sum
COPY go.mod go.sum ./

# Tải các gói cần thiết
RUN go mod download

# Sao chép toàn bộ mã nguồn vào container
COPY . .

# Xây dựng ứng dụng
RUN go build -o myapp .

# Mở cổng 3000
EXPOSE 8083

# Lệnh chạy ứng dụng
CMD ["./myapp"]