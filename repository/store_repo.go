package repository

import (
	"covi-b/model"
	"context"
	"covi-b/model/req"
)

type StoreRepo interface {
	GetStore(context context.Context, getStoreReq req.ReqGetStore) (model.Store, error)
	Create(context context.Context, createStore model.Store) (model.Store, error)
}