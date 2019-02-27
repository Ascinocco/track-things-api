# README

First run
1. docker-compose up
2. docker-compose run web rake db:create
3. docker-compose run web rails db:migrate

Commands:
$ docker-compose up

$ rails g model Todo title:string created_by:string
$ rails g model Item name:string done:boolean todo:references
$ rails g model User name:string email:string password_digest:string

$ rails db:migrate

$ bundle install
$ docker-compose build

$ rails g controller Todos
$ rails g controller Items
$ rails g controller Users
$ rails g controller v2/todos

$ rails g serializer todo

$ rails routes

---

how to update rails secrets: https://medium.com/@wintermeyer/goodbye-secrets-welcome-credentials-f4709d9f4698

The docker composition used for this api was build based on https://docs.docker.com/compose/rails/
Start the app with `docker-compose up`

You must start your rails and rake commands with `docker-compose run web _your command_`

---

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
