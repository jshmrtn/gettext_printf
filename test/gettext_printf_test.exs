defmodule GettextPrintfTest do
  use ExUnit.Case
  doctest GettextPrintf

  test "greets the world" do
    assert GettextPrintf.hello() == :world
  end
end
