# En este script vamos a explicar la sintaxis de los módulos
# y las funciones nombradas en Elixir. Vamos a ver todos los detalles
# que las hacen diferentes de la mayoría de los lenguajes
# más populares.

defmodule ElixirColors do
  @moduledoc """
  Esta es la documentación del módulo `ElixirColors`. Se usa para proveer
  infortmación en general sobre el módulo. Algo que no me gusta
  es que esta información se provee _después_ de la apertura del módulo
  y como verás más adelante, la información
  """

  @doc """
  Esta es la documentación de la función nombrada.
  Algo muy bueno es que se pueden incluir ejemplod de uso que gracias
  a la configuración del proyecto (que puedes ver en el archivo `mix.exs`)
  se pueden también ejecutar como pruebas. Puedes probarlo 
  en tu terminal con `mix test`, estando en la carpeta raíz del proyecto,
  en este caso `elixir_colors`.

  ## Examples

      iex> ElixirColors.name_to_rgb("rojo")
      "ff0000"

  """
  def name_to_rgb(name) do
    colors = %{
      "rojo" => "ff0000",
      "verde" => "00ff00",
      "azul" => "0000ff"
    }

    Map.get(colors, name, "___")
  end
end
