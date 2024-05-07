# Elixir se parece mucho a tu lenguaje tradcional

# Las variales se declaran solo indicando el nombre

a = 1

# Y los nombres la mayoría de las veces se comportan como variables comunes
# Por ejemplo, puedes reasignarlos

a = 2

# Pero aquí entra la primera diferencia con un lenguaje común
# El símbolo `=` no es asignación, sino de "pattern matching"
# o "emparejamiento de patrones". Lo que hace es intentar igualar
# el valor de la derecha con el de la izquierda, si tiene
# una nombre de varaible del lado izquierdo va a intentar asignarlo
# a lo que tiene en la izquierda, por eso funciona.

# Pero considerando que no es operador de asignación, también podemos
# hacer esto:

2 = a

# Va a funcionar sólo si `a` vale 2, porque el nombre de variable no
# va a intentar ser reasignado por estar del lado izquierdo.
# Si no puede *emparejar* los valores, Elixir fallará con un error
# en el que te dirá exactamente eso, por ejemplo, si escribes algo como:
#
# 3 = a
#
# Te dará un error como este:
#
# ** (MatchError) no match of right hand side value: 2

# Tener esto en cuenta es muy importante, porque se usa mucho en el lenguaje
# por ejemplo, para desestructurar tuplas, listas, mapas, etc.
# Aprovechando esto, veamos los tipos de datos básicos de Elixir.

# Tenemos números
# Enteros y sus operaciones básicas

a = 1 + 2 / (7 * 4 - 2)

# Flotantes y las misma operaciones

f = 1.0 + 2.0 / (7.0 * 4.0 - 2.0)

# Una cosa bonita es que podemos usar guienes_bajos para seapar números grandes

numero_grande = 1_000_000

# Pero también podemos usar notación científica

a = 1.0e-10

# También tenemos cadenas de texto, que en realidad son listas de valores binarios
# especiales que representan caracteres Unicode
# Las cadenas de texto SIEMPRE se escriben con comillas dobles, no uses comillas simples
nombre = "Héctor"
# Tenemos interpolación de cadenas, es decir, podemos insertar texto en ellas
# con `#{}`
saludo = "Hola, #{nombre}"

# Las cadenas por default son UTF-8, así que puedes usar caracteres especiales sin
# problemas

cadena_con_emojis = "🎉🎉🎉"

# El siguiente tipo de dato que se usa mucho es el Átomo
# los átomos son constatnes que valen su propio nombre
# Si no los has usado en otros lenguajes, pueden paracer misteriosos
# pero te vas a acostumbrar a ellos.
# Un átomo es una cadena de texto que empieza con dos puntos

un_atomo = :hola

# Una forma útil de pensar en ellos es como cadenas de texto inmutables
# que se guardan en un registro global en la máquina virtual de Elixir

# Los átomos más usados y devueltos por funciones de elixir son

:ok

:error

# Si lo piensas son como las constantes de otros lenguajes en las usamos
# nombres como `OK` o `ERROR` para indicar estados, pero en Elixir
# tenemos un tipo de dato especial para eso que nos ayuda a representar 
# significados sin ambigüedad y sin tener que creat una variable.
#
# Un uso común en la funciones es este que las funciones devuelven
# :ok si todo salió bien y :error si hubo un error.

# Hasta aquí es suficiente de tipos básicos.
# Ahora hablemos de colecciones, emepecemos con las listas

# Las listas son colecciones de elementos que pueden ser de cualquier tipo

# Las listas se escriben entre corchetes
mi_lista = [1, "dos", 3]

# Las listas, como tipo de dato en Eixit, son inmutables, es decir, no
# puedes cambiarlas, pero puedes crear nuevas a partti de ellas
# y asignarlas a la misma variable, lo que da la ilusión de que cambian
# Por ejemplo, con el operador `++` puedes concatenar listas, pero esto
# no modifica ninguna de las dos, sino que crea una nueva
mi_lista = mi_lista ++ [:cuatro]

# En elixir no existen los objetos, por lo que casi todos los tipos de datos
# tienen su módulo con las funciones para trabajar con ellos, por ejemplo
# para trabajar con lista tenemos el módulo `List`, pero como implementan
# la interfaz de otro módulo llamado `Enumerable` podemos usar funciones
# del módulo Enum para trabajar con ellas. Por ejemplo, si queremos imrpimir
# todos los elementos uno a uno, podemos usar `Enum.each`
# pero en esta mismo ejemplo te muestro cómo crear funciones anónimas.

Enum.each(mi_lista, fn elemento -> IO.puts("Elemento: #{elemento}") end)

# En este último ejemplo puedes ver la llamada a funciones de módulos a través
# de la notación del putno como en lenguajes orientados a objetos. No necesitamos
# importatlos, simplemente los usamos. Si quetemos usar las fucniones sin referrinos
# a su módulo, sí podemos usar `import`

import Enum, only: [each: 2]

each(mi_list, fn elemento -> IO.puts("Elemento: #{elemento}") end)

# Pero nos detuvimos de explicar las funciones anónimas.
# La sintaxis para definir es:

fn argumento -> :cuerpo end

# Para usar esta función, la tienes que mandar como argumento de otra
# o guardarla en una variable para usarla después
# Por ejemplo:

imprime_cuadrado = fn x -> IO.puts(x * x) end

# Para usarla podemos mandarla a each

each([1, 2, 3], imprime_cuadrado)

# Si la queremos usar directamente, tenemos que usar un punto entre el nombre
# y los paréntesis en los que mandamos los argumentos
# Esto solo es necesario con las funciones anónimas.

imprime_cuadrado.(5)

# Por suerte, es algo que no se ocupa demasiado, pero es para que no te
# confunfas si ves algo así en el código.
#
# Peero sigamos hablando de las listas
# las listas están implementadas como listas enlazadas al estilo de Lisp,
# por lo que se pueden pensar como estructuras recursivas, en donde el primer
# elemento se llama "cabeza" (head) y el resto de la lista se llama "cola" (tail)
# pero aquí entra la recursión: la cola es una lista que está compuesta de su cabeza
# y su cola, y así sucesivamente hasta que llega a una lista vacía.
#
# En elixir, para representar la división entre cabeza y cola se usa el operador `|`
# entonces, usando el pattern matching podemos hacer lo siquiente

[cabeza | cola] = [1, 2, 3, 4]

# Como tenemos dos nombres de variables del lado izquierdo
# se asigna el primer elemento a `cabeza` y el resto de la lista a `cola`
# lo puedes ver si imprimes los valores

IO.puts(cabeza)
IO.puts(cola)

# También podemos construir listas de esta forma

mi_lista = [1 | [2 | [3]]]
mi_lista = [1 | [2, 3, 4]]

# Esta característica es es muy útil para trabajar con las listas de forma recursiva.
# Por útltimo, ¿cómo accedemos a un elemento específico de una lista?
# NO SE RECOMIENDA hacerlo, sino tratar con las listas de manera completa,
# pero si de verdad lo necesitas puedes usar el módulo `Enum`:

Enum.at(mi_lista, 1)

# Tuplas
#
# Ahora pasemos a hablar de tuplas
# Las tuplas sirven para agrupar valores al igual que las listas, pero
# las tuplas no permiten operaciones como la concatenación o modificación de 
# de elementos para crear nuevas tuplas. Básicamente las creas y las usas.
# Se crean con llaves, agrupando los valores que necesitas.

{:mi_tupla, 1, "dos"}

# Cuando algo da como resultado una tupla (que es muy común con funciones quote do
# pueden fallar), usamos el emparejamiento de patrones para extraer los valores
# de la tupla, pero también para verificar si la función tuvo éxito o no.

{:ok, resultado} = File.open("archivo.txt", [:read])

# El módulo `File` tiene una función `open`, que recicebe dos arrgumentos,
# el primero es el nombre del archivoy el segundo una lista de los modos
# en los que quieres abrir el archivo.
# Si no tenemos un archivo `archivo.txt` en el directorio, la función `open`
# va a fallar, devolviendo un tupla que en la primera posición tiene
# `:error` y en la segunda posición el error especfífco, que en este caso
# sería `:enoent`, que significa "Ese archivo o directorio no existe".

# ¿Qué pasaría entonces con nuestra expresión de arriba?
# Recuerda que como `=` intenta emperejar valores y si la función devuelve
# :error y lo intentamos empazar con :ok, Elixir va fallar y terminar el proceso.

# Aquí vale la pena introducir nuestra primer estructura de control, el `case`
# Suponemos que queremos leer si existe el archivo, pero no crearlo si no existe.
# `case` nos ayuda a manejar los diferentes posibles resultados de una expresión
# y tomar un branch del programa dependiendo de eso.

case File.open("archivo.txt", [:read]) do
  {:ok, archivo} ->
    IO.puts("Archivo abierto")
    File.close(archivo)

  {:error, :enoent} ->
    IO.puts("El archivo no existe")
end

# case recibe una expresión y después de la para la palabra clave `do`
# tenemos que listar los valores contra los que hará pattern matching
# y funciona exactamente como un switch de otros lenguajes, cuando
# pueda emerejarlo con un valor, entonces ejecutará ese código.
#
# Sólo ejecutará uno de los "brazos" o bloques y nada si no puede hacer
# match con ninguno de los valores.
#
# Como las tuplas casi siempre se usan para hacer pattern matching, vale
# la pena mencionar una variable con un nombre especial: `_`
# Si no vas a ocuupar un valor y no quieres que el compilador de Elixir
# te muestre un aviso, usa esta vairable, por ejemplo:

{:error, _} = File.open("archivo.txt", [:read])

# La última cosa que vamos hablar de las tuplas está en con combinación
# con los átomos y las listas
# Estos se llaman KeywordList
#
# Son listas de tuplas de dos elementos, donde el primer elemento es un átomo
# forzosamente y el segundo elemento puede ser lo que quieras.
#
# Estas listas existen por compatibilidad con Erlang en donde se usan mucho.
# Esto es un KeywordList:
#
mi_keyword_list = [{:nombre, "Hector"}, {:edad, 34}]

# Pero son tan comunes que hay una sintaxis especial para crearlas
#
mi_keyword_list = [nombre: "Hector", edad: 34]

# Tienen muchas funciones parecidas a los diccionarios y tienen su propio módulo
# para trabajar con ellas, `Keyword` pero también puedes usar funciones de `Enum` y `List`
# porque cumplen con esas dos interfaces.

# Por último hablemos de diccionarios que son otra de las colecciones que 
# ocuparás muy seguido. Los diccionarios se definen con `%{}`, las llaves pueden
# ser de cualquier tipo de dato, para asociar una llave con un valor se usa una flecha 
# gorda: `=>`, y se pueden usar con su módulo `Map`

persona = %{:nombre => "Hector", :edad => 34}
