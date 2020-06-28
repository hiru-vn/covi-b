package handler

import (
	"covi-b/log"
	"covi-b/model"
	req "covi-b/model/req"
	"covi-b/repository"
	validator "github.com/go-playground/validator/v10"
	"github.com/labstack/echo"
	"net/http"
)

type UserStoreHandler struct {
	UserStoreRepo repository.UserStoreRepo
}

func (u UserStoreHandler) HandleCreate(c echo.Context) error {
	req := req.ReqCreateUserStore{}
	if err := c.Bind(&req); err != nil {
		log.Error(err.Error())
		return c.JSON(http.StatusBadRequest, model.Response{
			StatusCode: http.StatusBadRequest,
			Message:    err.Error(),
			Data:       nil,
		})
	}

	validate := validator.New()
	if err := validate.Struct(req); err != nil {
		log.Error(err.Error())
		return c.JSON(http.StatusBadRequest, model.Response{
			StatusCode: http.StatusBadRequest,
			Message:    err.Error(),
			Data:       nil,
		})
	}

	userstore := model.UserStore{
		TimeIn:  req.TimeIn,
		TimeOut:    req.TimeOut,
		UserId:  req.UserId,
		StoreId: req.StoreId,
	}

	userstore, err := u.UserStoreRepo.Create(c.Request().Context(), userstore)
	if err != nil {
		return c.JSON(http.StatusConflict, model.Response{
			StatusCode: http.StatusConflict,
			Message:    err.Error(),
			Data:       nil,
		})
	}

	return c.JSON(http.StatusOK, model.Response{
		StatusCode: http.StatusOK,
		Message:    "Xử lý thành công",
		Data:       userstore,
	})
}
