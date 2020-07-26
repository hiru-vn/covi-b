package req

type ReqGetNotify struct {
	Id int `json:"id,omitempty" validate:"required"`
}
