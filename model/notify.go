package model

import "database/sql"

type Notify struct {
	Id 	int `json:"id" db:"id, omitempty"`
	UserId sql.NullInt64 `json:"userid, omitempty" db:"userid, omitempty"`
	Time string `json:"time, omitempty" db:"time, omitempty"`
	Title string `json:"title,omitempty" db:"title, omitempty"`
	Content string `json:"content,omitempty" db:"content, omitempty"`
	Type string `json:"type,omitempty" db:"type, omitempty"`
}