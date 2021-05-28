# CRUD in 5 Minutes with Phoenix and Elixir

A basic guide teaching how install Erlang, Elixir and Phoenix where you'll be able to run your first CRUD.

Read the article at [CRUD in 5 Minutes with Phoenix and Elixir](https://www.wbotelhos.com/crud-in-5-minutes-with-phoenix-and-elixir).

# Setup

```sh
# clone the project
git clone git@github.com:wbotelhos/crud-in-5-minutes-with-phoenix-and-elixir.git

# access the project
cd crud-in-5-minutes-with-phoenix-and-elixir

# installs the dependencies
mix deps.get

# creates the database
mix ecto.setup

# installs assets
cd assets && yarn install && cd -

# run the server
mix phx.server

# open the browser
open localhost:4000/persons
```
