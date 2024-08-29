postgres:
	docker run --name postgres12 -p 5432:5432 -e POSTGRES_USER=root -e POSTGRES_PASSWORD=sun123 -d postgres:12-alpine
createdb:
	docker exec -it postgres12 createdb --username=root --owner=root marigold
dropdb:
	docker exec -it postgres12 dropdb marigold
migrateup:
	migrate -path migrations -database "postgresql://root:sun123@localhost:5432/marigold?sslmode=disable" -verbose up
migratedown:
	migrate -path migrations -database "postgresql://root:sun123@localhost:5432/marigold?sslmode=disable" -verbose down
.PHONY: postgres createdb dropdb
