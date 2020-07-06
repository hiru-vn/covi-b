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
	"github.com/lib/pq"
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

func (u *StoreRepoImpl) Create(context context.Context, createStore model.Store) (model.Store, error) {
	statement := `
		INSERT INTO "STORES"("code", "name", "isActive", "long", "lat", "address", "citycode")
		VALUES(:code, :name , :isActive, :long, :lat, :address, :citycode)
	`

	_, err := u.sql.Db.NamedExecContext(context, statement, createStore)
	if err != nil {
		log.Error(err.Error())
		if err, ok := err.(*pq.Error); ok {
			log.Error(err.Error())
			if err.Code.Name() == "unique_violation" {
				return createStore, banana.UserConflict
			}
		}
		return createStore, banana.DataNotFound
	}

	return createStore, nil
}
