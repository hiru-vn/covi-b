package req

type ReqCreateUserStore struct {
	TimeIn string `json:"timein,omitempty" validate:"required"` // tags
	TimeOut string `json:"timout,omitempty" validate:"required"`
	UserId int `json:"userid,omitempty" validate:"required"`
	StoreId int `json:"storeid,omitempty" validate:"required"`
}
