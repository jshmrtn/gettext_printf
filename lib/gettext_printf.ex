defmodule GettextPrintf do
  @moduledoc """
  Gettext Interpolator for printf.

  ## Instalation

  The package can be installed by adding `gettext_printf` to your list
  of dependencies in `mix.exs`:

      def deps do
        [
          {:gettext_printf, "~> 0.1.0"}
        ]
      end

  Add the `interpolation` option to your gettext module.

      defmodule MyApp.gettext do
        use Gettext, otp_app: :my_app, interpolation: GettextPrintf
      end

  ## Bindings

  Since `bindings` must be a map, the argument list can't be passed
  directly. Therefore all aguments must be passed as a list in a map
  with the key `bindings`. (See Examples Below)

  ## Plurals

  Since gettext does not know, which binding is the count or if it is
  even part of the message when using plurals, the binding `count` is
  not available.

  Therefore the binding `count` has to be specified manually as part
  of the `args`.

  ## Format Strings

  To see all available format strings, check out the `Cldr.Print` docs.

  ## Example Usage

        iex> import MyApp.Gettext
        iex> gettext("%02d-%02d-%04d date", %{bindings: [1, 11, 2021]})
        "01-11-2021 date"

    If not all arguments are provided, the return value is always the
    uninterpolated message.

        iex> import MyApp.Gettext
        iex> gettext("%02d-%02d-%04d date", %{bindings: [1, 11]})
        "%02d-%02d-%04d date"

  """

  @behaviour Gettext.Interpolation

  import Cldr.Print, only: [sprintf: 2]

  @doc false
  @impl Gettext.Interpolation
  def runtime_interpolate(message, %{bindings: bindings}) do
    case sprintf(message, bindings) do
      {:ok, interpolated} ->
        {:ok, interpolated}

      {:error,
       {ArgumentError,
        "The number of arguments must be at least equal to to the number of format placeholders."}} ->
        {:missing_bindings, message, [:bindings]}
    end
  end

  def runtime_interpolate(message, %{} = bindings),
    do: runtime_interpolate(message, Map.put(bindings, :bindings, []))

  @doc false
  @impl Gettext.Interpolation
  defmacro compile_interpolate(_translation_type, message, bindings) do
    quote do
      unquote(__MODULE__).runtime_interpolate(unquote(message), unquote(bindings))
    end
  end
end
