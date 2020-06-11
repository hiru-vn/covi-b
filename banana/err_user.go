package banana

import "errors"

var (
	UserConflict = errors.New("Người dùng đã tồn tại")
	SignUpFail = errors.New("Đăng ký thất bại")
	UserNotFound = errors.New("Khong co du lieu")
	DataNotFound = errors.New("Khong co du lieu")
)
