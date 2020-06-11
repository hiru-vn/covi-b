package repository

import (
	"covi-b/model"
	"context"
	"covi-b/model/req"
)

type StoreRepo interface {
	GetStore(context context.Context, getStoreReq req.ReqGetStore) (model.Store, error)
}