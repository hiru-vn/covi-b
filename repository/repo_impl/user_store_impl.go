package repo_impl

import (
	"context"
	"covi-b/banana"
	"covi-b/db"
	"covi-b/log"
	"covi-b/model"
	"covi-b/repository"
	"github.com/lib/pq"
)

type UserStoreRepoImpl struct {
	sql *db.Sql
}

func NewUserStoreRepo(sql *db.Sql) repository.UserStoreRepo {
	return &UserStoreRepoImpl{
		sql: sql,
	}
}

func (u UserStoreRepoImpl) Create(context context.Context, userstore model.UserStore) (model.UserStore, error) {
	statement := `
		INSERT INTO "USERSTORE"("timein", "timeout", "userid", "storeid")
		VALUES(:timein, :timeout, :userid, :storeid)
	`

	_, err := u.sql.Db.NamedExecContext(context, statement, userstore)
	if err != nil {
		log.Error(err.Error())
		if err, ok := err.(*pq.Error); ok {
			if err.Code.Name() == "unique_violation" {
				return userstore, banana.UserConflict
			}
		}
		return userstore, banana.DataNotFound
	}

	return userstore, nil
}