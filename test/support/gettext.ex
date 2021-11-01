defmodule MyApp.Gettext do
  @moduledoc false

  use Gettext, otp_app: :gettext_printf, interpolation: GettextPrintf
end

defmodule MyApp.Gettext.Use do
  @moduledoc false

  import MyApp.Gettext

  @spec compile_translation(bindings :: Keyword.t() | map) :: String.t()
  def compile_translation(bindings), do: gettext("%02d-%02d-%04d date (compile)", bindings)

  @spec compile_translation_no_bindings :: String.t()
  def compile_translation_no_bindings, do: gettext("test (compile)")
end
