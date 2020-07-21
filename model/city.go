package model

type City struct {
	Id 	int `json:"id, omitempty" db:"id, omitempty"`
	Name string `json:"name,omitempty" db:"name, omitempty"`
	InfectedCount int `json:"infectedCount" db:"infectedCount"`
	CuredCount int `json:"curedCount" db:"curedCount"`
	CriticalCount int `json:"criticalCount" db:"criticalCount"`
	InfectedLevel int `json:"infectedLevel" db:"infectedLevel"`
}