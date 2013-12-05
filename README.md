# namer

A simple web app to get help coming up with names for things. See it running at [www.helpname.it](http://www.helpname.it)

## Getting started developing

  * Install and launch [the Postgres app](http://postgresapp.com)
  * Bundle: `CONFIGURE_ARGS="with-pg-config=/Applications/Postgres93.app/Contents/MacOS/bin/pg_config" bundle`
  * Create a postgres role: run `psql`, then run `create role namer login createdb;`
  * Create the databases: `rake db:create:all`
  * Run migrations: `rake db:migrate`
  * Run tests: `rake`
  * Start the server: `foreman start`
  * Visit the site: `http://localhost:5000/`
