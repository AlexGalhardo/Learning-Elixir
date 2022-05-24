defmodule ExMon do
  alias ExMon.Player #, as: Banana

  def create_player(name, move_avg, move_rnd, move_heal) do
    # ExMon.Player.build(name, move_rnd, move_avg, move_heal)
    Player.build(name, move_rnd, move_avg, move_heal)
    # Banana.build(name, move_rnd, move_avg, move_heal)
  end
end
