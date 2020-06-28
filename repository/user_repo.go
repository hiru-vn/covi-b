package repository

import (
	"covi-b/model"
	"context"
	"covi-b/model/req"
)

type UserRepo interface {
	SaveUser(context context.Context, user model.User) (model.User, error)
	CheckLogin(context context.Context, loginReq req.ReqSignIn) (model.User, error)
	UpdateUser(context context.Context, loginReq req.ReqUpdate) (model.User, error)
	MarkInfected(context context.Context, markInfectedReq req.ReqMarkInfected) (model.User, error)
	UnMarkInfected(context context.Context, markInfectedReq req.ReqMarkInfected) (model.User, error)
}