# En este script vamos a explicar la sintaxis de los módulos
# y las funciones nombradas en Elixir. Vamos a ver todos los detalles
# que las hacen diferentes de la mayoría de los lenguajes
# más populares.

# Empecemos defininedo un módulo.

defmodle ModulosYFunciones do
  @moduledoc """
  Esta es la documentación del módulo que se puede extraer de manera
  automática con la herramienta de ExDoc. Es una buena idea documentar
  los módulos y las funciones aquí porque esta cerca de la definición
  y porque se puede generar un documento independiente.

  """
  def saludar(nombre) do
    IO.puts("Hola #{nombre}")
  end

  def saludar(nombre, apellido) do
  end

  #
end
