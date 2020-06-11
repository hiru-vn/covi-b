package req

type ReqGetStore struct {
	Id int `json:"id,omitempty" validate:"required"`
}
