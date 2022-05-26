defmodule PokemonApiWeb.WelcomeController do
  use PokemonApiWeb, :controller

  def index(conn, _params) do
    # IO.inspect(conn)
    text(conn, "Welcome to Pokemon API!")
  end
end
