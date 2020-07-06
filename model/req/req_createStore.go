package req

type ReqCreateStore struct {
	Code  string `json:"code,omitempty" validate:"required"` // tags
	Name string `json:"name,omitempty" validate:"required"`
	IsActive  bool    `json:"isActive,omitempty" validate:"required"`
	Long float64    `json:"long,omitempty" validate:"required"`
	Lat float64    `json:"lat,omitempty" validate:"required"`
	Address string    `json:"address,omitempty" validate:"required"`
	Citycode int    `json:"citycode,omitempty" validate:"required"`
}