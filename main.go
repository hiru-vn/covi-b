package main

import (
	"covi-b/db"
	"covi-b/handler"
	log "covi-b/log"
	"covi-b/repository/repo_impl"
	"covi-b/router"
	"fmt"
	"github.com/labstack/echo"
	"os"
)

func init() {
	os.Setenv("APP_NAME", "github")
	log.InitLogger(true)
}

func main() {
	sql := &db.Sql {
		Host: "localhost",
		Port: 5432,
		UserName: "huyuit",
		Password: "astroboy19",
		DbName: "covi",
	}
	sql.Connect()
	e := echo.New()

	userHandler := handler.UserHandler{
		UserRepo: repo_impl.NewUserRepo(sql),
	}
	storeHandler := handler.StoreHandler{
		StoreRepo: repo_impl.NewStoreRepo(sql),
	}
	userstoreHandler := handler.UserStoreHandler{
		UserStoreRepo: repo_impl.NewUserStoreRepo(sql),
	}
	cityHandler := handler.CityHandler{
		CityRepo: repo_impl.NewCityRepo(sql),
	}
	notifyHandler := handler.NotifyHandler{
		NotifyRepo: repo_impl.NewNotifyRepo(sql),
	}

	api := router.API {
		Echo:       e,
		UserHandler: userHandler,
		StoreHandler: storeHandler,
		UserStoreHandler: userstoreHandler,
		CityHandler: cityHandler,
		NotifyHandler: notifyHandler,
	}
	api.SetupRouter()

	e.Logger.Fatal(e.Start(":3000"))

	defer sql.Close()
	fmt.Sprintln("connect db ok")
}
