defmodule Qoup.Structs.Player do
  defstruct [:stuff]

  @type player_id :: integer()
  @type role :: atom
  @type t :: %__MODULE__{
          stuff: atom()
        }

  @spec make_players(Qoup.Game.State.deck(), [player_id()]) :: nil
  def make_players(deck, player_ids) do
    nil
  end
end
