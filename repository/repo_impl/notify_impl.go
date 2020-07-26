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

type NotifyRepoImpl struct {
	sql *db.Sql
}

func NewNotifyRepo(sql *db.Sql) repository.NotifyRepo {
	return &NotifyRepoImpl{
		sql: sql,
	}
}

func (u *NotifyRepoImpl) GetNotify(context context.Context, getNotifyReq req.ReqGetNotify) ([]model.Notify, error) {
	var notifications []model.Notify
	// Query the DB
	err := u.sql.Db.Select(&notifications, "select * from queryNOTIFY($1)", getNotifyReq.Id)
	if err != nil {
		if err == sql.ErrNoRows {
			return notifications, banana.DataNotFound
		}
		log.Error(err.Error())
		return notifications, err
	}

	return notifications, nil

}
