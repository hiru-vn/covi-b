package repo_impl

import (
	"context"
	"covi-b/banana"
	"covi-b/db"
	"covi-b/log"
	"covi-b/model"
	"covi-b/repository"
	"database/sql"
)

type CityRepoImpl struct {
	sql *db.Sql
}

func NewCityRepo(sql *db.Sql) repository.CityRepo {
	return &CityRepoImpl{
		sql: sql,
	}
}

func (u *CityRepoImpl) GetAll(context context.Context) ([]model.City, error) {
	var cities []model.City
	// Query the DB
	err := u.sql.Db.Select(&cities, "SELECT * FROM \"CITY\"")
	if err != nil {
		if err == sql.ErrNoRows {
			return cities, banana.DataNotFound
		}
		log.Error(err.Error())
		return cities, err
	}

	return cities, nil
}