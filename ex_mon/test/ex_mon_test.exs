defmodule ExMonTest do
  use ExUnit.Case

  import ExUnit.CaptureIO

  alias ExMon.Player

  describe "create_player/4" do
    test "returns a player" do
      # assert "this test must fail" == ExMon.create_player("Alex", :chute, :soco, :cura)

      expected_response = %Player{life: 100, moves: %{move_avg: :chute, move_heal: :cura, move_rnd: :soco}, name: "Alex"}

      assert expected_response == ExMon.create_player("Alex", :chute, :soco, :cura)
    end
  end

  describe "start_game/4" do
    test "when the game starts, returns a message" do
      player = Player.build("Alex", :chute, :soco, :cura)

      messages =
        capture_io(fn ->
          assert ExMon.start_game(player) == :ok
        end)

      # assert messages == "this test must fail"

      assert messages =~ "The game has started"
      assert messages =~ "status: :started"
      assert messages =~ "moves: %{move_avg: :punch, move_heal: :heal, move_rnd: :kick}"
    end
  end

  describe "make_move/1" do
    setup do
      player = Player.build("Alex", :chute, :soco, :cura)

      capture_io(fn ->
        ExMon.start_game(player)
      end)

      :ok
    end

    test "when the move is valid, do the move and the computer makes a move" do
      messages =
        capture_io(fn ->
          ExMon.make_move(:chute)
        end)

      # assert messages == "this test must fail"

      assert messages =~ "The PLAYER attacked the Computer dealing"
      assert messages =~ "moves: %{move_avg: :soco, move_heal: :cura, move_rnd: :chute},\n"
    end

    test "when the move is invalid, returns a error message" do
      messages =
        capture_io(fn ->
          ExMon.make_move(:wrong)
        end)

      # assert messages == "this test must fail"

      assert messages =~ "Invalid move: wrong!"
    end
  end
end
