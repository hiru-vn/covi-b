package model

import (
	"database/sql"
)

type UserStore struct {
	Id 	int `json:"id, omitempty" db:"id, omitempty"`
	TimeIn sql.NullTime `json:"timein,omitempty" db:"timein, omitempty"`
	TimeOut sql.NullTime `json:"timeout,omitempty" db:"timeout, omitempty"`
	UserId int `json:"userid,omitempty" db:"userid, omitempty"`
	StoreId sql.NullString `json:"storeid,omitempty" db:"storeid, omitempty"`
}