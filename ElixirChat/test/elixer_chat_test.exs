defmodule ElixerChatTest do
  use ExUnit.Case
  doctest ElixerChat

  test "greets the world" do
    assert ElixerChat.hello() == :world
  end
end
