# Weather APP

This is a weather app for CarrerFoundry

## Installing

Inside your project, run this command:

```
Bundle install
```
## Database

The project use PostgreSQL as database. Setup your local database and modify database.yml file with your credentials, then run:

```
rake db:migrate
```

then run:

```
rails server
```


## Running the tests


run the tests!

```
rspec
```

## Points to improve

* Get a better ui and user experience.
* Better error handling for the not found cities. Right now only depends from the API response.
* Include capybara tests.
* Add cache the fetched weather data.

## Authors

* **Juan David Giraldo** - *Initial work* - [JuanGiraldo](https://github.com/JuandGirald)

