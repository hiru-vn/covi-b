package repository

import (
"covi-b/model"
"context"
"covi-b/model/req"
)

type NotifyRepo interface {
	GetNotify(context context.Context, getNotifyReq req.ReqGetNotify) ([]model.Notify, error)
}