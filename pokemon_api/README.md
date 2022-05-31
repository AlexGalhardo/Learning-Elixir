# PokemonApi

- $ mix archive.install hex phx_new 1.5.3
- $ mix phx.new pokemon_api --no-webpack --no-html

To start your Phoenix server:

  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.setup`
  * Start Phoenix endpoint with `mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](https://hexdocs.pm/phoenix/deployment.html).

## Learn more

  * Official website: https://www.phoenixframework.org/
  * Guides: https://hexdocs.pm/phoenix/overview.html
  * Docs: https://hexdocs.pm/phoenix
  * Forum: https://elixirforum.com/c/phoenix-forum
  * Source: https://github.com/phoenixframework/phoenix

```elixir
iex(1)> params = %{name: "Alex", password_hash: "senha123"}
%{name: "Alex", password_hash: "senha123"}

iex(3)> PokemonApi.Trainer.changeset(params)
#Ecto.Changeset<
  action: nil,
  changes: %{name: "Alex", password_hash: "senha123"},
  errors: [],
  data: #PokemonApi.Trainer<>,
  valid?: true
>
```

## iex
- $ iex -S mix
- params = %{name: "alex", password_hash: "123456"}
- changeset = PokemonApi.Trainer.changeset(params)
- Argon2.add_hash("123456")
- params = %{name: "alex", password: "123456"}
- PokemonApi.Repo.insert(changeset)
- PokemonApi.Repo.all(PokemonApi.Trainer)
- PokemonApi.Repo.get(PokemonApi.Trainer, "uuid-here")
- alias PokemonApi.Trainer
- alias PokemonApi.Repo
- Repo.all(Trainer)
- PokemonApi.delete_trainer("a6c996c0-3142-41fa-8916-95af8082a0c8")
- PokemonApi.fetch_trainer("acd1ad58-6f16-4ecb-a59e-47760a6adb5f")
- params = %{id: "acd1ad58-6f16-4ecb-a59e-47760a6adb5f", name: "Banana Silva", password: "123456"}
- params = %{"id" => "acd1ad58-6f16-4ecb-a59e-47760a6adb5f", "name" => "Banana Silva", "password" => "123456"}


## Commands
- $ mix ecto.drop
- $ mix ecto.create
- $ mix phx.server
- $ iex -S mix phx.server
- $ mix ecto.gen.migration create_trainer_table
- $ mix ecto.migrate
- $ mix deps.get
- $ http post http://localhost:4000/api/trainers name="alex" password="123456"
