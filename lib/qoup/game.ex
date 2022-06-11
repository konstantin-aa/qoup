defmodule Qoup.Game do
  use GenServer

  @type start_args :: %{
          # Nostrum.id as an int
          player_id: [integer()],
          expansion: String.t()
        }

  @spec start_game(start_args()) :: GenServer.on_start()
  def start_game(start_args) do
    GenServer.start_link(__MODULE__, start_args)
  end

  @impl true
  def init(start_args) do
    Qoup.Game.State.init(start_args)
  end
end
