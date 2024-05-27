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
  ## Examples

      iex> ElixirColors.hello()
      :world

  """
  def hello do
    :world
  end
end
