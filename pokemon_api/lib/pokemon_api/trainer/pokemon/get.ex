defmodule PokemonApi.Trainer.Pokemon.Get do
  alias PokemonApi.{Trainer.Pokemon, Repo}

  alias Ecto.UUID
  # Ecto.UUID.generate()

  def call(id) do
    case UUID.cast(id) do
      :error -> {:error, "Invalid ID format!"}
      {:ok, uuid} -> get(uuid)
    end
  end

  defp get(uuid) do
    case Repo.get(Pokemon, uuid) do
      nil -> {:error, "Pokemon not found!"}
      # pokemon -> {:ok, pokemon}
      pokemon -> {:ok, Repo.preload(pokemon, :trainer)}
    end
  end
end
