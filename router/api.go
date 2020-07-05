package router

import (
	"covi-b/handler"
	"github.com/labstack/echo"
)

type API struct {
	Echo *echo.Echo
	UserHandler handler.UserHandler
	StoreHandler handler.StoreHandler
	UserStoreHandler handler.UserStoreHandler
}

func (api *API) SetupRouter() {
	//user
	api.Echo.POST("/user/sign-in", api.UserHandler.HandleSignIn)
	api.Echo.POST("/user/sign-up", api.UserHandler.HandleSignUp)
	api.Echo.POST("/user/update", api.UserHandler.HandleUpdate)
	api.Echo.POST("/user/markInfected", api.UserHandler.HandleMarkInfected)
	api.Echo.POST("/user/unmarkInfected", api.UserHandler.HandleUnMarkInfected)
	api.Echo.POST("/user/unmarkInfected", api.UserHandler.HandleUnMarkInfected)
	api.Echo.G("/user/getInfected", api.UserHandler.HandleGetInfected)

	//store
	api.Echo.GET("/store/get", api.StoreHandler.HandleGetStore)

	//userstore
	api.Echo.POST("/userstore/create", api.UserStoreHandler.HandleCreate)

}