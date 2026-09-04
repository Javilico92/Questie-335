# Questie-335

Adaptación del addon [Questie](https://github.com/Questie/Questie) de WoW Classic cuyo objetivo es proporcionar compatibilidad con el cliente de Wrath of the Lich King versión 3.3.5a (12340).

# Instalación

- [Descarga](https://github.com/Javilico92/Questie-335/releases) el archivo.
- Extráelo dentro del directorio `Interface/AddOns/`. El nombre de la carpeta debe ser `Questie-335`.
- Si juegas en un servidor personalizado que emula una expansión anterior utilizando el cliente 3.3.5, puedes añadir `-Classic` o `-TBC` al nombre de la carpeta del addon para cargar únicamente los archivos necesarios para la expansión elegida.
- En caso de que tu servidor no proporcione un parche para el mapa del mundo, debes activar la siguiente opción dentro del juego: `Opciones/Avanzado/Usar datos de mapa de WotLK`.

> [!IMPORTANT]
> Debido a la gran cantidad de servidores 3.3.5 existentes, debes tener en cuenta que no todos los servidores funcionan de la misma manera con los addons, `CHAT_MSG_ADDON` u otros sistemas similares. </br></br>
>
> Para los usuarios de **WARMANE** hay dos cosas que deben tenerse en cuenta:</br></br>
>
> Los **susurros (Whisper)** solo funcionan para jugadores de **nivel 10 o superior**, por lo que algunas partes de **QuestieComm** no funcionan como se espera por debajo de ese nivel. Por ejemplo, la sincronización completa del registro de misiones al entrar en un grupo.</br></br>
>
> Además, **QuestieComm** utilizaba un formato que **no funciona correctamente en Warmane**, por lo que se necesita **Questie 10.23.2 o superior** para solucionar este problema:
> https://github.com/Javilico92/Questie-335/commit/4c5304698183ea3675e9cb9851d71e4f527b9d59
> </br></br>
>
> También juego en UltimoWoW y Nelwy y, por el momento, parece que no existen problemas.

## Otros idiomas
- [English](README.md)
- [Español](README_ES.md)

# Questie

[![Discord oficial de Questie (no es mío)](https://img.shields.io/badge/discord-Questie-738bd7)](https://discord.gg/s33MAYKeZd)
[![Estrellas](https://img.shields.io/github/stars/Javilico92/Questie-335)](https://img.shields.io/github/stars/Javilico92/Questie-335)

[![Descargas](https://img.shields.io/github/downloads/Javilico92/Questie-335/total.svg)](https://github.com/Javilico92/Questie-335/releases/)
[![Descargas última versión](https://img.shields.io/github/downloads/Javilico92/Questie-335/v11.0.1/total.svg)](https://github.com/Javilico92/Questie-335/releases/latest)
[![Fecha última versión](https://img.shields.io/github/release-date/Javilico92/Questie-335.svg)](https://github.com/Javilico92/Questie-335/releases/latest)
[![Commits desde la última versión](https://img.shields.io/github/commits-since/Javilico92/Questie-335/latest.svg)](https://github.com/Javilico92/Questie-335/commits/master)


## Descarga

[La última versión disponible puede encontrarse aquí](https://github.com/Javilico92/Questie-335/releases).

Por el momento no existe ninguna otra forma de descargar o actualizar el addon Questie-335.


## Información

- [Preguntas frecuentes](https://github.com/Questie/Questie/wiki/FAQ)
- Puedes hablar con la comunidad de Questie en su [servidor de Discord](https://discord.gg/s33MAYKeZd).
- Puedes utilizar el [sistema de incidencias](https://github.com/Javilico92/Questie-335/issues) para informar de errores o proponer nuevas funciones (requiere una cuenta de GitHub).
- Al crear una incidencia, sigue la plantilla proporcionada para facilitar y agilizar una posible solución.
- Si recibes un mensaje de error del cliente de WoW, incluye el texto **completo** del error o una captura de pantalla en el informe.
    - Debes introducir `/console scriptErrors 1` una vez en el chat del juego para que se muestren los errores de Lua. Posteriormente puedes volver a desactivarlos con `/console scriptErrors 0`.

¡Créenos, es (bueno)!


## Idiomas

Questie incluye traducciones para todos los idiomas oficiales de WoW Classic. Estos son:

Inglés, alemán, francés, español, portugués, ruso, chino simplificado, chino tradicional y coreano.

Si quieres ayudar con las traducciones, puedes consultar la [carpeta de traducciones](https://github.com/Questie/Questie/tree/master/Localization/Translations) y buscar traducciones pendientes mediante:

> `["<tuIdioma>"] = false` (por ejemplo, `["deDE"] = false`)

y sustituir `false` por una cadena que contenga la nueva traducción, por ejemplo:

> `["<tuIdioma>"] = "TuTraducción"`

Además, existe soporte para ucraniano ([mediante otro addon](https://www.curseforge.com/wow/addons/questie-translation-ukrainian)).

Siguiendo [esta guía](https://github.com/Questie/Questie/wiki/Localization-to-more-languages) puedes añadir soporte para todavía más idiomas.


## Contribuciones

- Agradecemos cualquier ayuda y contribución, así que no dudes en enviar un Pull Request en GitHub.


### Instalación de Lua

1. Instala [Lua](https://www.lua.org/download.html) (versión 5.1, ya que el cliente de WoW utiliza Lua 5.1).
   - En macOS: `brew install lua@5.1`
2. Instala [luarocks](https://luarocks.org/).
   - En macOS: `brew install luarocks`
3. Configura `luarocks` para utilizar la versión correcta de Lua (por defecto, luarocks utiliza la versión más reciente instalada).
   - `luarocks config lua_version 5.1`
4. Instala [busted](https://github.com/lunarmodules/busted).
   - `luarocks install busted`
5. Instala `bit32`.
    - `luarocks install bit32`
6. Instala [luacheck](https://github.com/lunarmodules/luacheck).
    - `luarocks install luacheck`


### luacheck

Questie utiliza `luacheck` para comprobar la calidad y posibles errores del código.

Puedes ejecutarlo localmente con:

`luacheck -q Database Localization Modules Questie.lua`


### Pruebas unitarias

1. Ejecuta `busted -p ".test.lua" .` en el directorio raíz del proyecto.
2. Al añadir nuevas pruebas, asegúrate de nombrarlas `<module>.test.lua` y colocarlas junto al módulo correspondiente.


## Donaciones

Si quieres apoyar económicamente el desarrollo de los creadores originales de Questie (**no a mí**), puedes hacerlo mediante PayPal:

<a href="https://www.paypal.com/cgi-bin/webscr?cmd=_s-xclick&hosted_button_id=JCUBJWKT395ME&source=url"><img src="https://www.paypalobjects.com/en_US/i/btn/btn_donate_LG.gif"/></a>


## Características


### Mostrar misiones en el mapa

- Muestra indicadores para los puntos de inicio y entrega de misiones, así como para sus objetivos.
- Muestra las rutas de movimiento de los NPC mediante líneas de waypoint.

![Questie Quest Givers](https://i.imgur.com/4abi5yu.png)
![Questie Complete](https://i.imgur.com/DgvBHyh.png)
![Questie Tooltip](https://i.imgur.com/uPykHKC.png)


### Rastreador de misiones

- Rastrea automáticamente las misiones al aceptarlas.
- Puede mostrar todas las misiones del registro al mismo tiempo, en lugar del límite predeterminado de 5.
- Haz clic izquierdo sobre una misión para abrir el registro de misiones (configurable).
- Haz clic derecho para acceder a más opciones, por ejemplo:
    - Centrar una misión (hace que los iconos de las demás misiones sean translúcidos).
    - Mostrar una flecha apuntando hacia el objetivo (requiere el addon [TomTom](https://www.curseforge.com/wow/addons/tomtom)).

![QuestieTracker](https://user-images.githubusercontent.com/8838573/67285596-24dbab00-f4d8-11e9-9ae1-7dd6206b5e48.png)


### Comunicación de misiones

- Puedes ver el progreso de las misiones de los miembros de tu grupo en los tooltips.


### Tooltips

- Muestra información adicional en los iconos del mapa y en NPC/objetos relacionados con misiones.
- Mantener pulsada la tecla Shift mientras pasas el cursor sobre un icono del mapa muestra información adicional, como la experiencia otorgada por la misión.


### Registro de viaje

- Questie registra los pasos de tu aventura en la ventana **"Mi viaje"**. Haz clic izquierdo sobre el botón del minimapa y selecciona **"Mi viaje"**, o escribe `/questie journey`.

![Journey](https://user-images.githubusercontent.com/8838573/67285651-3cb32f00-f4d8-11e9-95d8-e8ceb2a8d871.png)


### Misiones por zona

- Questie muestra todas las misiones de una zona, separadas entre misiones completadas y disponibles. ¡Hay que completarlas todas! Haz clic izquierdo sobre el botón del minimapa y selecciona **"Misiones por zona"**.

![QuestsByZone](https://user-images.githubusercontent.com/8838573/67285665-450b6a00-f4d8-11e9-9283-325d26c7c70d.png)


### Búsqueda

- Puedes realizar búsquedas dentro de la base de datos de Questie. Haz clic derecho sobre el botón del minimapa para abrirla.

![Search](https://user-images.githubusercontent.com/8838573/67285691-4f2d6880-f4d8-11e9-8656-b3e37dce2f05.png)


### Configuración

- Amplias opciones de configuración. Haz clic derecho sobre el botón del minimapa para abrirlas o escribe `/questie`.