# Vamos a hacer un juego básico de adivinanzas.
# El objetivo es adivinar un número entre el 1 y el 100 seleccionado
# al azar por el programa. Se tienen un número limitado de intentos, digamos 5.

# Esto lo vamos a hacer como un script de Elixir
# para repasar la sintaxis básica que pudiste ver en el archivo `sintaxis_basica.exs`
#

# Vamos a hacerlo amigable, poniendo mensajitos y todo

# Puedes ver que no se necesitan los `;` al final de las líneas
n_tries = 5

# Ahora escogemos el número secreto
# Aquí estamos uando un módulo de Erlang
secret_number = :rand.uniform(100)

IO.puts("¡Hola! Bienvenido al juego de adivinar el número")
IO.puts("Tienes #{n_tries} para adivinar un número secreto entre 1 y 100")

# Pero el tipo de dato que tenemos es una cadena de texto
# Si lo comparamos con un número Elixir nos va a dejaer pero
# será una comparación errónea.

# Puedes darte cuenta con IO.inspect(number)
defmodule Evaluator do
  def evaluate(secret_number, tries) when tries > 0 do
    IO.puts("Dime un número entre 1 y 100:")
    number = IO.read(:line)
    IO.puts("Tú número es #{number}")
    number = number |> String.trim() |> String.to_integer()

    cond do
      number < secret_number ->
        IO.puts("Muy bajo")
        IO.puts("Te quedan #{tries - 1} intentos")
        evaluate(secret_number, tries - 1)

      number > secret_number ->
        IO.puts("Muy alto")
        IO.puts("Te quedan #{tries - 1} intentos")
        evaluate(secret_number, tries - 1)

      true ->
        IO.puts("¡Felicidades! ¡Adivinaste!")
    end
  end

  def evaluate(secret_number, 0) do
    IO.puts("¡Lo siento! ¡No adivinaste! El numero era: #{secret_number}")
  end
end

Evaluator.evaluate(secret_number, n_tries)
