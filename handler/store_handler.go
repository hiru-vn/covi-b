package handler

import (
	"covi-b/log"
	"covi-b/model"
	"covi-b/model/req"
	"covi-b/repository"
	"github.com/go-playground/validator/v10"
	"github.com/labstack/echo"
	"net/http"
)

type StoreHandler struct {
	StoreRepo repository.StoreRepo
}

func (u *StoreHandler) HandleGetStore(c echo.Context) error {
	req := req.ReqGetStore{}
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

	store, err := u.StoreRepo.GetStore(c.Request().Context(), req)
	if err != nil {
		return c.JSON(http.StatusUnauthorized, model.Response{
			StatusCode: http.StatusUnauthorized,
			Message:    err.Error(),
			Data:       nil,
		})
	}

	return c.JSON(http.StatusOK, model.Response{
		StatusCode: http.StatusOK,
		Message:    "Xử lý thành công",
		Data:       store,
	})
}