defmodule ExMon.Player do
  # required_keys = [:life, :name, :move_rnd, :move_avg, :move_heal]
  # @required_keys [:life, :name, :move_rnd, :move_avg, :move_heal]
  @required_keys [:name, :life, :moves]

  @enforce_keys @required_keys
  defstruct @required_keys

  @max_life 100 # variável de módulo, sempre constante

  def build(name, move_rnd, move_avg, move_heal) do
    %ExMon.Player{
      name: name,
      life: @max_life,
      moves: %{
        move_rnd: move_rnd,
        move_avg: move_avg,
        move_heal: move_heal
      }
    }
  end
end
