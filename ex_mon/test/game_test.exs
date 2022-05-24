defmodule ExMon.GameTest do
  use ExUnit.Case

  alias ExMon.{Game, Player}

  describe "start/2" do
    test "start the game state" do
      player = Player.build("Alex", :chute, :soco, :cura)
      computer = Player.build("Robotinik", :chute, :soco, :cura)

      # Verificar se vai falhar primeiro, antes de passar
      # assert Game.start(computer, player) == "this test must fail"

      # verifica se vai passar
      assert {:ok, _pid} = Game.start(computer, player)
    end
  end

  describe "info/0" do
    test "return the current game state" do
      player = Player.build("Alex", :chute, :soco, :cura)
      computer = Player.build("Robotinik", :chute, :soco, :cura)

      Game.start(computer, player)

      expected_response = %{
        computer: %Player{life: 100, moves: %{move_avg: :soco, move_heal: :cura, move_rnd: :chute}, name: "Robotinik"},
        player: %Player{life: 100, moves: %{move_avg: :soco, move_heal: :cura, move_rnd: :chute}, name: "Alex"},
        status: :started,
        turn: :player
      }

      # assert Game.info() == "this test must fail"

      # assert Game.info() == expected_response
      assert expected_response == Game.info()
    end
  end

  describe "update/1" do
    test "returns the game state updated" do
      player = Player.build("Alex", :chute, :soco, :cura)
      computer = Player.build("Robotinik", :chute, :soco, :cura)

      Game.start(computer, player)

      expected_response = %{
        computer: %Player{life: 100, moves: %{move_avg: :soco, move_heal: :cura, move_rnd: :chute}, name: "Robotinik"},
        player: %Player{life: 100, moves: %{move_avg: :soco, move_heal: :cura, move_rnd: :chute}, name: "Alex"},
        status: :started,
        turn: :player
      }

      assert expected_response == Game.info()

      new_state = %{
        computer: %Player{life: 85, moves: %{move_avg: :soco, move_heal: :cura, move_rnd: :chute}, name: "Robotinik"},
        player: %Player{life: 50, moves: %{move_avg: :soco, move_heal: :cura, move_rnd: :chute}, name: "Alex"},
        status: :started,
        turn: :player
      }

      Game.update(new_state)

      expected_response = %{new_state | turn: :computer, status: :continue}

      assert expected_response == Game.info()
    end
  end
end
