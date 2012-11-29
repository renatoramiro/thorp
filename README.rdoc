== Welcome to Thorp

Thorp is a Simple Social Networking. We do not intend to compete with any other social network.

This is only a demo application.

Visit: link:http://thorp.startupseven.net

== Install the development

Clone this code.

Install dependences:

```console
bundle install --without test
```

Edit the config/database.yml and add you info the database.

create the database:

```console
bundle exec rake db:create
```

Exec the migrations

```console
bundle exec rake db:migrate
```

start you application

```console
rails s
```
