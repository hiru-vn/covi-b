package req

type ReqSignUp struct {
	FullName string `json:"fullName,omitempty" validate:"required"` // tags
	Username string `json:"username,omitempty" validate:"required"`
	Password string `json:"password,omitempty" validate:"required"`
}
