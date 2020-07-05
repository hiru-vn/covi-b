package req

type ReqSignIn struct {
	Username string `json:"username,omitempty" validate:"required"`
	Password string `json:"password,omitempty" validate:"required"`
	Long float64 `json:"long,omitempty" validate:"required"`
	Lat float64 `json:"lat,omitempty" validate:"required"`
}
