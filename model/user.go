package model

import "time"

type User struct {
	Id 	string `json:"-" db:"id, omitempty"`
	FullName string `json:"fullName,omitempty" db:"fullname, omitempty"`
	Username string `json:"username,omitempty" db:"username, omitempty"`
	Password string `json:"password,omitempty" db:"password, omitempty"`
	YearOfBirth string `json:"yearOfBirth,omitempty" db:"yearOfBirth, omitempty"`
	Code time.Time `json:"code" db:"code, omitempty"`
	Phone time.Time `json:"phone" db:"phone, omitempty"`
	Citycode string `json:"citycode" db:"citycode, omitempty"`
	Address string `json:"address" db:"address, omitempty"`
	TransmissionLevel string `json:"transmissionLevel" db:"transmissionLevel, omitempty"`
}