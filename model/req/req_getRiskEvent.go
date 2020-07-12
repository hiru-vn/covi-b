package req

type ReqRiskEvent struct {
	UserId int `json:"userId,omitempty" validate:"required"`
}
