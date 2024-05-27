# Empecemos defininedo un módulo.

defmodle ModulosYFunciones do
  @moduledoc """
      Esta es la documentación del módulo que se puede extraer de manera
    automática con la herramienta de ExDoc. Es una buena idea documentar
    los módulos y las funciones aquí porque esta cerca de la definición
    y porque se puede generar un documento independiente.
  """
  def saludar(nombre) do
    @doc """
        Esta e la documentación de la función, también puede incluir ejemplos de uso que después
    son corridos como pruebas (pero sólo si estás dentro de una _aplicación_ de Elixir)

    iex> ModulosYFunciones.saludar("Mundo")
    Hola Mundo

    """

    IO.puts("Hola #{nombre}")
  end

  def saludar(nombre, apellido) do
  end

  #
end
