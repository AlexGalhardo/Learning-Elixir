# ExMon

- $ mix new ex_mon

## Map
- jogador = %{name: "Rafael", move_avg: :chute, move_rand: :soco, move_heal: :cure, life: 100}
```elixir
iex(1)> jogador = %{name: "Alex", move_avg: :chute, move_rand: :soco, move_heal: :cure, life: 100}
%{
  life: 100,
  move_avg: :chute,
  move_heal: :cure,
  move_rand: :soco,
  name: "Alex"
}
```

## Struct
```elixir
iex(1)> ExMon.Player
ExMon.Player
iex(2)> %ExMon.Player{}
%ExMon.Player{
  life: nil,
  move_avg: nil,
  move_heal: nil,
  move_rnd: nil,
  name: nil
} 

iex(3)> %ExMon.Player{life: 100}
%ExMon.Player{
  life: 100,
  move_avg: nil,
  move_heal: nil,
  move_rnd: nil,
  name: nil
}
```
- com enforce_keys
```elixir
%ExMon.Player{life: 100}
** (ArgumentError) the following keys must also be given when building struct ExMon.Player: [:name, :move_rnd, :move_avg, :move_heal]
    (ex_mon) expanding struct: ExMon.Player.__struct__/1
    iex:5: (file)
```
```elixir
iex(6)> ExMon.Player.build("alex", :chute, :soco, :cura)
%ExMon.Player{
  life: 100,
  move_avg: :soco,
  move_heal: :cura,
  move_rnd: :chute,
  name: "alex"
}

ExMon.create_player("alex", :chute, :soco, :cura)
%ExMon.Player{
  life: 100,
  move_avg: :chute,
  move_heal: :cura,
  move_rnd: :soco,
  name: "alex"
}

iex(1)> player = ExMon.create_player("Alex", :chute, :soco, :cura)
%ExMon.Player{
  life: 100,
  move_avg: :chute,
  move_heal: :cura,
  move_rnd: :soco,
  name: "Alex"
}

iex(2)> ExMon.start_game(player)
{:ok, #PID<0.215.0>}

iex(4)> ExMon.Game.info
%{
  computer: %ExMon.Player{
    life: 100,
    move_avg: :punch,
    move_heal: :heal,
    move_rnd: :kick,
    name: "Robotinik"
  },
  player: %ExMon.Player{
    life: 100, 
    move_avg: :chute,
    move_heal: :cura,
    move_rnd: :soco,
    name: "Alex"
  },
  status: :started,
  turn: :player
}


ExMon.start_game(player)
The game has started!
:ok


iex(3)> ExMon.Game.player
%ExMon.Player{
  life: 100,
  move_avg: :chute,
  move_heal: :cura,
  move_rnd: :soco,
  name: "Alex"
}

iex(3)> ExMon.make_move(:chute)
{:ok, :move_avg}


iex(6)> ExMon.make_move(:soco)

====== The PLAYER attacked the Computer dealing 14 damage! ======

:ok
iex(7)> ExMon.make_move(:chute)

====== The COMPUTER attacked the Player dealing 19 damage! ======

:ok


iex(10)> ExMon.Game.info()
%{
  computer: %ExMon.Player{
    life: 66,
    moves: %{move_avg: :punch, move_heal: :heal, move_rnd: :kick},
    name: "Robotinik"
  },
  player: %ExMon.Player{
    life: 60,
    moves: %{move_avg: :chute, move_heal: :cura, move_rnd: :soco},
    name: "Alex"
  },
  status: :continue,
  turn: :player
}

```

## Random range
- Enum.random(1..20)

**TODO: Add description**

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `ex_mon` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:ex_mon, "~> 0.1.0"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/ex_mon](https://hexdocs.pm/ex_mon).


## Credo Deps
- https://github.com/rrrene/credo

```elixir
defp deps do
  [
    {:credo, "~> 1.6", only: [:dev, :test], runtime: false}
  ]
end
```
- $ mix deps.get
- $ mix credo