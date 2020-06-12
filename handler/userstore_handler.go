package handler

import (
	"covi-b/log"
	"covi-b/model"
	req "covi-b/model/req"
	"covi-b/repository"
	securiry "covi-b/security"
	validator "github.com/go-playground/validator/v10"
	"github.com/labstack/echo"
	"net/http"
)

type UserStoreHandler struct {
	UserRepo repository.UserRepo
}

func (u UserStoreHandler) HandleCreate(c echo.Context) error {
	req := req.ReqSignUp{}
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

	hash := securiry.HashAndSalt([]byte(req.Password))

	user := model.User{
		FullName:  req.FullName,
		Username:    req.Username,
		Password:  hash,
	}

	user, err := u.UserRepo.SaveUser(c.Request().Context(), user)
	if err != nil {
		return c.JSON(http.StatusConflict, model.Response{
			StatusCode: http.StatusConflict,
			Message:    err.Error(),
			Data:       nil,
		})
	}

	user.Password = ""
	return c.JSON(http.StatusOK, model.Response{
		StatusCode: http.StatusOK,
		Message:    "Xử lý thành công",
		Data:       user,
	})
}
