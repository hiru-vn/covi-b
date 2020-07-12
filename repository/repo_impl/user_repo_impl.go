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
	res, err2 := u.sql.Db.Exec("UPDATE \"USERS\" SET \"long\" =$1 , \"lat\" = $2 where username=$3" , loginReq.Long, loginReq.Lat, loginReq.Username)

	if err != nil {
		if err == sql.ErrNoRows {
			return user, banana.UserNotFound
		}
		if (res != nil) {
			return user, err
		}

		log.Error(err.Error())
		return user, err
	}

	if err2 != nil {
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
	err := u.sql.Db.GetContext(context, &user, "UPDATE \"USERS\" SET \"isInfected\" =false, phone = $1 , \"yearOfBirth\" = $2 , citycode = $3 , address = $4 , long = $5 , lat = $6 where id=$7", updateReq.Phone, updateReq.YearOfBirth, updateReq.CityCode, updateReq.Address, updateReq.Long, updateReq.Lat, updateReq.Id)

	if err != nil {
		print(err.Error())
	}

	return user, nil
}

func (u *UserRepoImpl) MarkInfected(context context.Context, markInfectedReq req.ReqMarkInfected) (model.User, error) {
	var user = model.User{}
	err := u.sql.Db.GetContext(context, &user, "UPDATE \"USERS\" SET \"isInfected\" =true where id=$1" , markInfectedReq.Id)

	if err != nil {
		print(err.Error())
	}

	return user, nil
}

func (u *UserRepoImpl) UnMarkInfected(context context.Context, markInfectedReq req.ReqMarkInfected) (model.User, error) {
	var user = model.User{}
	err := u.sql.Db.GetContext(context, &user, "UPDATE \"USERS\" SET \"isInfected\" = false where id=$1" , markInfectedReq.Id)

	if err != nil {
		print(err.Error())
	}

	return user, nil
}

func (u *UserRepoImpl) UpdateRisk(context context.Context, addRiskReq req.ReqAddRisk) (model.User, error) {
	var user = model.User{}
	err := u.sql.Db.GetContext(context, &user, "SELECT * FROM \"USERS\" WHERE id=$1", addRiskReq.Id)


	if err != nil {
		if err == sql.ErrNoRows {
			return user, banana.UserNotFound
		}
		log.Error(err.Error())
		
		return user, err
	}

	return user, nil
}

func (u *UserRepoImpl) GetInfected(context context.Context) ([]model.User, error) {
	var users []model.User
	// Query the DB
	err := u.sql.Db.Select(&users, "SELECT * FROM \"USERS\" WHERE \"isInfected\"=true;")
	if err != nil {
		if err == sql.ErrNoRows {
			return users, banana.DataNotFound
		}
		log.Error(err.Error())
		return users, err
	}

	return users, nil
}

func (u *UserRepoImpl) GetRiskEvent(context context.Context, getRiskEventReq req.ReqRiskEvent) ([]model.InfectedCoordinate, error) {
	var data []model.InfectedCoordinate
	// Query the DB
	err := u.sql.Db.Select(&data, "select * from queryINFECTEDCOORDINATE($1)", getRiskEventReq.UserId)
	if err != nil {
		if err == sql.ErrNoRows {
			return data, banana.DataNotFound
		}
		log.Error(err.Error())
		return data, err
	}

	return data, nil
}
