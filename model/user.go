package model

import (
	"database/sql"
)

type User struct {
	Id 	int `json:"id, omitempty" db:"id, omitempty"`
	FullName string `json:"fullName,omitempty" db:"fullname, omitempty"`
	Username string `json:"username,omitempty" db:"username, omitempty"`
	Password string `json:"password,omitempty" db:"password, omitempty"`
	YearOfBirth sql.NullString `json:"yearOfBirth,omitempty" db:"yearOfBirth, omitempty"`
	Long sql.NullFloat64 `json:"long,omitempty" db:"long, omitempty"`
	Lat sql.NullFloat64 `json:"lat,omitempty" db:"lat, omitempty"`
	Code sql.NullString `json:"code,omitempty" db:"code, omitempty"`
	Phone sql.NullString `json:"phone,omitempty" db:"phone, omitempty"`
	Citycode sql.NullString `json:"citycode, omitempty" db:"citycode, omitempty"`
	Address sql.NullString `json:"address, omitempty" db:"address, omitempty"`
	TransmissionLevel sql.NullString `json:"transmissionLevel, omitempty" db:"transmissionLevel, omitempty"`
	IsInfected sql.NullBool `json:"isInfected,omitempty" db:"isInfected,omitempty"`
}