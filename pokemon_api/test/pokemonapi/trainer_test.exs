defmodule PokemonApi.TrainerTest do
  use PokemonApi.DataCase

  alias PokemonApi.Trainer

  describe "changeset/v1" do
    test "when all params are valid, returns a valid changeset" do
      params = %{name: "alex", password: "123456"}

      response = Trainer.changeset(params)

      assert %Ecto.Changeset{
               changes: %{
                 name: "alex",
                 password: "123456"
               },
               errors: [],
               data: %PokemonApi.Trainer{},
               valid?: true
             } = response
    end

    test "when there are invalid params, returns an invalid changeset" do
      params = %{password: "123456"}

      response = Trainer.changeset(params)

      assert %Ecto.Changeset{
               changes: %{
                 password: "123456"
               },
               data: %PokemonApi.Trainer{},
               valid?: false
             } = response

      assert errors_on(response) == %{name: ["can't be blank"]}
    end
  end

  describe "build/1" do
    test "when there are invalid params, returns an Trainer struct" do
      params = %{name: "alex", password: "123456"}

      response = Trainer.build(params)

      assert {:ok, %Trainer{name: "alex", password: "123456"}} = response
    end

    test "when are invalid params, returns an error" do
      params = %{password: "123456"}

      {:error, response} = Trainer.build(params)

      assert %Ecto.Changeset{valid?: false} = response

      assert errors_on(response) == %{name: ["can't be blank"]}
    end
  end
end
