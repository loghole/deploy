WITH_JAEGER ?= true

run: run-depends run-services
	$(info ******** LogHole started ********)

run-services:
	@echo 'Init services'
	@docker-compose up -d collector dashboard

run-depends: .run-jaeger .run-clickhouse-db

.run-jaeger:
	@docker-compose up -d jaeger

.run-clickhouse-db:
	@docker-compose up -d clickhouse-db
	@sleep 5s

down:
	@docker-compose down