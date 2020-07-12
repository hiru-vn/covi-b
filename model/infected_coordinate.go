package model

import "database/sql"

type InfectedCoordinate struct {
	Id 	int `json:"id, omitempty" db:"id, omitempty"`
	User1Id int `json:"user1id, omitempty" db:"user1id, omitempty"`
	User2Id int `json:"user2id, omitempty" db:"user2id, omitempty"`
	StoreId int `json:"storeid,omitempty" db:"storeid, omitempty"`
	User1infectlevel int `json:"user1infectlevel, omitempty" db:"user1infectlevel, omitempty"`
	User2infectlevel int `json:"user2infectlevel, omitempty" db:"user2infectlevel, omitempty"`
	Date sql.NullString `json:"date,omitempty" db:"date, omitempty"`
	Long float64 `json:"long,omitempty" db:"long, omitempty"`
	Lat float64 `json:"lat,omitempty" db:"lat, omitempty"`
	Citycode sql.NullString `json:"citycode, omitempty" db:"citycode, omitempty"`
	Address string `json:"address, omitempty" db:"address, omitempty"`
}