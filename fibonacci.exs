# En este archivo vamos a definir el módulo
# que calcula Fibonacci de manera más eficiente,
# usando programación dinámica.
defmodule Fibonacci do
  def of(0), do: 0
  def of(1), do: 1
  def of(n), do: of(n - 1) + of(n - 2)
end
