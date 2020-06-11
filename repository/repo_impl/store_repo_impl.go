package repo_impl

import (
	"context"
	"covi-b/banana"
	"covi-b/db"
	"covi-b/log"
	"covi-b/model"
	"covi-b/model/req"
	"covi-b/repository"
	"database/sql"
)

type StoreRepoImpl struct {
	sql *db.Sql
}

func NewStoreRepo(sql *db.Sql) repository.StoreRepo {
	return &StoreRepoImpl{
		sql: sql,
	}
}

func (u *StoreRepoImpl) GetStore(context context.Context, getStoreRreq req.ReqGetStore) (model.Store, error) {
	var store = model.Store{}
	err := u.sql.Db.GetContext(context, &store, "SELECT * FROM \"STORES\" WHERE id=$1", getStoreRreq.Id)


	if err != nil {
		if err == sql.ErrNoRows {
			return store, banana.DataNotFound
		}
		log.Error(err.Error())
		return store, err
	}

	return store, nil
}
