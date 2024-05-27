defmodule ElixirColorsTest do
  use ExUnit.Case
  doctest ElixirColors

  test "basico de texto a RGB" do
    assert ElixirColors.name_to_rgb("rojo") == "ff0000"
  end
end
