package req

type ReqCreateUserStore struct {
	TimeIn string `json:"fullName,omitempty" validate:"required"` // tags
	TimeOut string `json:"username,omitempty" validate:"required"`
	Password string `json:"password,omitempty" validate:"required"`
}
