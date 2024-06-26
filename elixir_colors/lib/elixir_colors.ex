# En este script vamos a explicar la sintaxis de los módulos
# y las funciones nombradas en Elixir. Vamos a ver todos los detalles
# que las hacen diferentes de la mayoría de los lenguajes
# más populares.

defmodule ElixirColors do
  @moduledoc """
  Esta es la documentación del módulo `ElixirColors`. Se usa para proveer
  infortmación en general sobre el módulo. Algo que no me gusta
  es que esta información se provee _después_ de la apertura del módulo
  y, como verás más adelante, la documentación de las funciones se pone
  antes.

  Los módulos son la forma más básica de organizar el código
  en Elixir. Este módulo es un ejemplo de un conjunto de funciones
  para trabajar con representaciones de colores como ejemplo
  sencillo de uso de funciones nombradas.
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
  # Las funciones nombradas en Elixir se definen con la palabra reservada `def` seguido del nombre
  # y entre paréntsis los argumentos. Para definir el cuerpo de la funnción no usamos
  # llaves; lo encerramos entre `do` y `end`.
  def name_to_rgb(name) do
    colors = %{
      "rojo" => "ff0000",
      "verde" => "00ff00",
      "azul" => "0000ff"
    }

    # Las funciones siempre tienen un valor de retorno: el valor que devuelva
    # lo último que se ejecute en la función

    Map.get(colors, name, "___")
  end

  # En Elixir, también podemos pensar que `def` es una función que recibe dos argumentos:
  # el nombre de la función junto con los argumentos y el cuerpo de la función. (En realidad
  # es una macro, que veremos después).
  # Pero lo importante es que a veces vas ver esta sintaxis cuando es una función corta:

  # no necesita `end` porque es una línea
  def expand(pair), do: "#{pair}#{pair}#{pair}"

  # Algo interesante es que las funciones están definidas tanto por su nombre como por
  # el número de argumentos que reciben, que es lo que se llama la "aridad" (_arity_) de la función.
  # Por ejemplo, las siguientes funciones se llaman igual pero tienen diferente aridad:

  # Esta se llama `combine/2`
  def combine(a, b) do
    # Esta forma de combinar colores, pero supongamos que sí
    a <> b
  end

  # Esta se llama `combine/3`
  def combine(a, b, c) do
    # Esta no es la forma de combinar colores, pero supongamos que sí
    a <> b <> c
  end

  # Pero esto que acabas de ver sólo es una forma de la aplicación del pattern
  # matching a los parámetros de las funciones, y puedes hacerlo con cualquier valor
  # por ejemplo:

  def is_white?("fff"), do: true
  def is_white?("ffffff"), do: true
  def is_white?(_), do: false

  # En estas funciones que acabas de ver tenemos varias cosas interesantes:
  # es una función con tres "cabezas" (heads), con el mismo número de argumentos
  # y que hacen empatado directamtmente con el valor que representa blanco, en las dos opciones que
  # podemos tener. Esto funciona como un switch de otros lenguajes, la primera defición que
  # empate con el patrón que definimos es la que se ejecuta.
  # Por eso, si tuviéramos la que manda el valor a `_` (es como si desecharamos el valor), al principio
  # las funciones de abajo no podrían ejecutarse nunca, porque este patrón siempre empata con todo.
  #
  # Otra cosa insteresante no tan presente en otros lenguajes es el `?` al final del nombre de la función.
  # Es una costumbre ponerlo en Elixir cuando una función devuelve `true` o `false`, pero no es obligatorio
  # sino una buena idea para que el código sea más legible (esto viene direactamente de la comunidad de Ruby)

  # --------------------------------------------
  # Todas las funciones que acabas de ver son públicas, es decir, se
  # pueden llmar desde fuera del módulo, pero también podemos definir funciones
  # privadas con `defp`. Estas funciones sólo se pueden llamar desde dentro del
  # módulo. Poder definir funciones privadas sirve mucho para crear interfaces
  # de módulos que sean más útiles y fáciles de usar, así como evitar dependencias
  # innecesarias entre módulos, al evitar exponer la implmentación completa de las
  # funciones.

  defp normalize_color(color) do
    String.downcase(color)
  end
end
