package req

type ReqMarkInfected struct {
	Id int `json:"id,omitempty" validate:"required"`
}