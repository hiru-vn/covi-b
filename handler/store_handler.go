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

func (u StoreHandler) HandleCreate(c echo.Context) error {
	req := req.ReqCreateStore{}
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

	store := model.Store{
		Code:  req.Code,
		Name:    req.Name,
		IsActive: req.IsActive,
		Long: req.Long,
		Lat: req.Lat,
		Address: req.Address,
		Citycode: req.Citycode,
	}

	store, err := u.StoreRepo.Create(c.Request().Context(), store)
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
		Data:       store,
	})
}
