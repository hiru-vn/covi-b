package req

type ReqUpdate struct {
	Id int `json:"id,omitempty" validate:"required"`
	Phone string `json:"phone,omitempty" validate:"required"`
	YearOfBirth int `json:"yearOfBirth,omitempty" validate:"required"` // tags
	CityCode string `json:"citycode,omitempty" validate:"required"`
	Address string `json:"address,omitempty" validate:"required"`
}