package model

type UserStore struct {
	Id 	int `json:"id, omitempty" db:"id, omitempty"`
	TimeIn string `json:"timein,omitempty" db:"timein, omitempty"`
	TimeOut string `json:"timeout,omitempty" db:"timeout, omitempty"`
	UserId int `json:"userid,omitempty" db:"userid, omitempty"`
	StoreId int `json:"storeid,omitempty" db:"storeid, omitempty"`
}