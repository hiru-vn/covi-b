package handler

import (
	"covi-b/model"
	"covi-b/repository"
	"github.com/labstack/echo"
	"net/http"
)

type CityHandler struct {
	CityRepo repository.CityRepo
}

func (u CityHandler) HandleGetAll(c echo.Context) error {
	cities, err := u.CityRepo.GetAll(c.Request().Context())
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
		Data:       cities,
	})
}
