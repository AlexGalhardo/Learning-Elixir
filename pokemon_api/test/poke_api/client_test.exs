defmodule PokemonApi.PokeApi.ClientTest do
  use ExUnit.Case
  import Tesla.Mock

  alias PokemonApi.PokeApi.Client

  # variável de módulo
  @base_url "https://pokeapi.co/api/v2/pokemon"

  describe "get_pokemon/1" do
    test "when there is a pokemon with the given name, returns the pokemon" do
      body = %{"name" => "pikachu", "weight" => 60, "types" => ["electric"]}

      mock(fn %{method: :get, url: @base_url <> "/pikachu"} ->
        # "banana"
        %Tesla.Env{status: 200, body: body}
      end)

      response = Client.get_pokemon("pikachu")

      excepted_response = {:ok, %{"name" => "pikachu", "weight" => 60, "types" => ["electric"]}}

      assert response == excepted_response
    end

    test "when there is no pokemon with the given name, returns error" do
      mock(fn %{method: :get, url: @base_url <> "/banana"} ->
        %Tesla.Env{status: 404}
      end)

      response = Client.get_pokemon("banana")

      excepted_response = {:error, %{message: "Pokemon not found!", status: 404}}

      assert response == excepted_response
    end

    test "when there is an unexpected error, returns the error" do
      mock(fn %{method: :get, url: @base_url <> "/pikachu"} ->
        {:error, :timeout}
      end)

      response = Client.get_pokemon("pikachu")

      excepted_response = {:error, :timeout}

      assert response == excepted_response
    end
  end
end
