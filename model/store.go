package model

type Store struct {
	Id 	int `json:"id" db:"id, omitempty"`
	Code string `json:"code, omitempty" db:"code, omitempty"`
	Name string `json:"name, omitempty" db:"name, omitempty"`
	IsActive bool `json:"isActive,omitempty" db:"isActive, omitempty"`
	Long float64 `json:"long,omitempty" db:"long, omitempty"`
	Lat float64 `json:"lat,omitempty" db:"lat, omitempty"`
	Citycode int `json:"citycode, omitempty" db:"citycode, omitempty"`
	Address string `json:"address, omitempty" db:"address, omitempty"`
}