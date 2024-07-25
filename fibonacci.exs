# Implementemos de manera sencilla Fibonacci, puedes ver como casi
# es directamente la definición matemática de la sucesión.

defmodule FibonacciNaive do
  def fib(n) when n <= 1, do: n
  # Esta implementación es ineficiente porque calcula el mismo número un montón de veces
  def fib(n), do: fib(n - 1) + fib(n - 2)
end
