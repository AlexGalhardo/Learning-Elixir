defmodule PokemonApi.Trainer.CreateTest do
  use PokemonApi.DataCase

  alias PokemonApi.{Repo, Trainer}
  alias Trainer.Create

  describe "call/1" do
    test "when all params are valid, creates a trainer" do
      params = %{name: "alex", password: "123456"}

      count_before = Repo.aggregate(Trainer, :count)

      response = Create.call(params)

      count_after = Repo.aggregate(Trainer, :count)

      # valor = "Rafael"

      assert {:ok, %Trainer{name: "alex"}} = response
      assert count_after > count_before
    end

    test "when there are invalid params, returns the error" do
      params = %{name: "alex"}

      response = Create.call(params)

      assert {:error, changeset} = response
      assert errors_on(changeset) == %{password: ["can't be blank"]}
    end
  end
end
