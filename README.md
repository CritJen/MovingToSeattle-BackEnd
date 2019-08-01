# Moving to Seattle Backend

This is the backend half of the Moving to Seattle project. It contains a rails server which manages data stored in a PostgreSQL database, seeded by a script which is runnable from an endpoint in the Rails web service. For the front end application which utilizes this service see https://github.com/CritJen/MovingtoSeattle.

## Setting Up The Backend

- Clone the repository

```
git@github.com:CritJen/MovingToSeattle-BackEnd.git
```

- Run bundle install to install the required Gems

```
bundle install
```

- Create and seed the database

```
rails db:reseed
```


- Start your local server

```
rails server
```

- Get updated data

To seed the databases with current data simply visit http://localhost:3000/load_data. This will retrieve data from various third-party data sources.

### Next steps

Now navigate to the repository for the frontend to complete set up: https://github.com/CritJen/MovingtoSeattle

### Built With

[Rails](https://rubyonrails.org/) - MVC framework built in [Ruby](https://www.ruby-lang.org/en/)\
[PostgreSQL](https://www.postgresql.org/) - Open source relational database server

### Author

Jennifer Clark
