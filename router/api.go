package router

import (
	"covi-b/handler"
	"github.com/labstack/echo"
)

type API struct {
	Echo *echo.Echo
	UserHandler handler.UserHandler
	StoreHandler handler.StoreHandler
}

func (api *API) SetupRouter() {
	//user
	api.Echo.POST("/user/sign-in", api.UserHandler.HandleSignIn)
	api.Echo.POST("/user/sign-up", api.UserHandler.HandleSignUp)
	api.Echo.POST("/user/update", api.UserHandler.HandleUpdate)

	//store
	api.Echo.GET("/store/get", api.StoreHandler.HandleGetStore)
}