package db

import (
	"fmt"
	"github.com/jmoiron/sqlx"
	_ "github.com/lib/pq"
	log "github.com/sirupsen/logrus"
)

type Sql struct {
	Db *sqlx.DB
	Host string
	Port int
	UserName string
	Password string
	DbName string
}

func (s *Sql) Connect() {
	dataSource := fmt.Sprintf(
		"host=%s port=%d user=%s password=%s dbname=%s sslmode=disable",
		s.Host, s.Port, s.UserName, s.Password,s.DbName)
	s.Db = sqlx.MustConnect("postgres", dataSource)
	err := s.Db.Ping()
	if err != nil {
		log.Error(err.Error())
	}

}

func (s *Sql) Close() {
	s.Db.Close()
}