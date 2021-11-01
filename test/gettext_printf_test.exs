defmodule GettextPrintfTest do
  @moduledoc false

  use ExUnit.Case, async: true

  import MyApp.Gettext

  alias MyApp.Gettext.Use

  doctest GettextPrintf

  describe "runtime" do
    test "works with all bindings" do
      assert "01-11-2021 date (runtime)" ==
               gettext("%02d-%02d-%04d date (runtime)", %{bindings: [1, 11, 2021]})
    end

    test "warns with missing bindings" do
      assert "%02d-%02d-%04d date (runtime)" ==
               gettext("%02d-%02d-%04d date (runtime)", %{bindings: [1, 11]})
    end

    test "works with no interpolation" do
      assert "test (runtime)" = gettext("test (runtime)")
    end
  end

  describe "compile time" do
    test "works with all bindings" do
      assert "01-11-2021 date (compile)" == Use.compile_translation(%{bindings: [1, 11, 2021]})
    end

    test "warns with missing bindings" do
      assert "%02d-%02d-%04d date (compile)" == Use.compile_translation(%{bindings: [1, 11]})
    end

    test "works with no interpolation" do
      assert "test (compile)" = Use.compile_translation_no_bindings()
    end
  end
end
