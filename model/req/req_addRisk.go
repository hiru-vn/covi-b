package req

type ReqAddRisk struct {
	Id int `json:"id,omitempty" validate:"required"`
}
