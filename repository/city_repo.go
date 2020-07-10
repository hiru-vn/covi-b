package repository

import (
	"context"
	"covi-b/model"
)

type CityRepo interface {
	GetAll(context context.Context) ([]model.City, error)
}