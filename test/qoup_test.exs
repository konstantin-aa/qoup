defmodule QoupTest do
  use ExUnit.Case
  doctest Qoup

  test "greets the world" do
    assert Qoup.hello() == :world
  end
end
