package repo_impl

import (
	"context"
	"covi-b/banana"
	"covi-b/db"
	"covi-b/log"
	"covi-b/model"
	"covi-b/model/req"
	"covi-b/repository"
	"database/sql"
	_ "database/sql"
	"github.com/lib/pq"
)

type UserRepoImpl struct {
	sql *db.Sql
}

func NewUserRepo(sql *db.Sql) repository.UserRepo {
	return &UserRepoImpl{
		sql: sql,
	}
}

func (u UserRepoImpl) SaveUser(context context.Context, user model.User) (model.User, error) {
	statement := `
		INSERT INTO "USERS"("fullname", "username", "password")
		VALUES(:fullname, :username, :password)
	`

	_, err := u.sql.Db.NamedExecContext(context, statement, user)
	if err != nil {
		log.Error(err.Error())
		if err, ok := err.(*pq.Error); ok {
			if err.Code.Name() == "unique_violation" {
				return user, banana.UserConflict
			}
		}
		return user, banana.SignUpFail
	}

	var newU = model.User{}
	err2 := u.sql.Db.GetContext(context, &newU, "SELECT * FROM \"USERS\" WHERE username=$1", user.Username)


	if err2 != nil {
		if err2 == sql.ErrNoRows {
			return newU, banana.UserNotFound
		}
		log.Error(err.Error())
		return newU, err
	}

	return newU, nil
}

func (u *UserRepoImpl) CheckLogin(context context.Context, loginReq req.ReqSignIn) (model.User, error) {
	var user = model.User{}
	err := u.sql.Db.GetContext(context, &user, "SELECT * FROM \"USERS\" WHERE username=$1", loginReq.Username)


	if err != nil {
		if err == sql.ErrNoRows {
			return user, banana.UserNotFound
		}
		log.Error(err.Error())
		return user, err
	}

	return user, nil

}

func (u *UserRepoImpl) UpdateUser(context context.Context, updateReq req.ReqUpdate) (model.User, error) {
	var user = model.User{}
	err := u.sql.Db.GetContext(context, &user, "UPDATE \"USERS\" SET phone = $1 , \"yearOfBirth\" = $2 , citycode = $3 , address = $4 where id=$5", updateReq.Phone, updateReq.YearOfBirth, updateReq.CityCode, updateReq.Address, updateReq.Id)

	if err != nil {
		print(err.Error())
	}

	return user, nil
}