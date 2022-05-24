defmodule ExMon do
  # alias ExMon.Player #, as: Banana
  alias ExMon.{Game, Player}
  alias ExMon.Game.{Actions, Status}

  @computer_name "Robotinik"

  def create_player(name, move_avg, move_rnd, move_heal) do
    # ExMon.Player.build(name, move_rnd, move_avg, move_heal)
    Player.build(name, move_rnd, move_avg, move_heal)
    # Banana.build(name, move_rnd, move_avg, move_heal)
  end

  def start_game(player) do
    # computer = create_player("Robotinik", :punch, :kick, :heal)
    # ExMon.Game.start(computer, player)
    # "Robotiniki"
    @computer_name
    |> create_player(:punch, :kick, :heal)
    |> Game.start(player)

    Status.print_round_message(Game.info())
  end

  def make_move(move) do
    # Actions.fetch_move(move)
    move
    |> Actions.fetch_move()
    |> do_move()
  end

  defp do_move({:error, move}), do: Status.print_wrong_move_message(move)
  defp do_move({:ok, move}) do
    case move do
      :move_heal -> "realiza cura"
      move -> Actions.attack(move)
    end

    Status.print_round_message(Game.info())
  end
end
