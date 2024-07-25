# Implementemos de manera sencilla Fibonacci, puedes ver como casi
# es directamente la definición matemática de la sucesión.

defmodule FibonacciNaive do
  def of(n) when n <= 1, do: n
  # Esta implementación es ineficiente porque calcula el mismo número un montón de veces
  def of(n), do: of(n - 1) + of(n - 2)
end
