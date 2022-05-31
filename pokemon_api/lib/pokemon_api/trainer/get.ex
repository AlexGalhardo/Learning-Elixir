defmodule PokemonApi.Trainer.Get do
  alias PokemonApi.{Trainer, Repo}

  alias Ecto.UUID
  # Ecto.UUID.generate()

  def call(id) do
    case UUID.cast(id) do
      :error -> {:error, "Invalid ID format!"}
      {:ok, uuid} -> get(uuid)
    end
  end

  defp get(uuid) do
    case Repo.get(Trainer, uuid) do
      nil ->
        {:error, "Trainer not found!"}

      # trainer -> {:ok, trainer}
      trainer ->
        {:ok, Repo.preload(trainer, :pokemon)}
    end
  end
end
