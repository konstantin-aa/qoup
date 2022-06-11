defmodule Qoup.Game.State do
  alias Qoup.Game
  alias Qoup.Structs.Player

  defstruct [:players, :deck]

  @type deck :: [Player.role()]
  @type t :: %__MODULE__{
          players: %{
            Player.player_id() => Player.t()
          },
          deck: deck()
        }

  @spec init(Game.start_args()) :: {:ok, t()}
  def init(%{player_ids: player_ids, expansion: expansion}) do
    {deck, players} =
      expansion
      |> make_deck()
      |> Player.make_players(player_ids)

    state = %__MODULE__{
      players: players,
      deck: deck
    }

    {:ok, state}
  end

  @spec make_deck(String.t(), [String.t()]) :: deck()
  defp make_deck(expansion, custom_layout \\ []) do
    default_roles = [:ambassador, :assassin, :captain, :contessa, :duke]

    # for the future!
    case expansion do
      "custom" ->
        custom_layout
        |> Enum.chunk_every(2)
        |> Enum.map(fn {role_string, number} ->
          role_string |> String.to_existing_atom() |> List.duplicate(number)
        end)
        |> List.flatten()

      _ ->
        default_roles
        |> Enum.map(fn role -> List.duplicate(role, 3) end)
        |> List.flatten()
    end
  end
end
