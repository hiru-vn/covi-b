package repository

import (
	"context"
	"covi-b/model"
)

type UserStoreRepo interface {
	Create(context context.Context, userstore model.UserStore) (model.UserStore, error)
}