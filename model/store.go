package model

import (
	"database/sql"
)

type Store struct {
	Id 	int `json:"id" db:"id, omitempty"`
	Code sql.NullString `json:"code, omitempty" db:"code, omitempty"`
	Name sql.NullString `json:"name, omitempty" db:"name, omitempty"`
	IsActive sql.NullBool `json:"isActive,omitempty" db:"isActive, omitempty"`
	Long sql.NullFloat64 `json:"long,omitempty" db:"long, omitempty"`
	Lat sql.NullFloat64 `json:"lat,omitempty" db:"lat, omitempty"`
	Citycode sql.NullString `json:"citycode, omitempty" db:"citycode, omitempty"`
	Address sql.NullString `json:"address, omitempty" db:"address, omitempty"`
}