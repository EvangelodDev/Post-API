# README

API para la creación, obtención, edición y borrado de Posts. Se utiliza Ruby on Rails separando la implementación en Modelo, Vista y Controlador. Se tiene la regla de que tanto el nombre como el contenido no pueden ser nulos. Se utiliza Jbuilder para mostrar la información como JSON.

Consideraciones: No es necesario en una instancia no publicada la necesidad de usuarios, pero si la seguridad es un tema a considerar para deployar este proyecto, es imporante configurar CORS para que no tome todas las direcciones y solo considere la aplicación, ademas de hacer un sistema de usuarios con Device y Tokens JWT.

Para ejecutar:
* Ir a la ruta principal del proyecto (donde se encuentra dockerfile).
* Ejecutar "docker-compose up --build".
* Esperar a que aparezca el mensaje "Use Ctrl+C to stop", después de mostrar el puerto.
* Considerar que la primera query toma un poco más de tiempo al iniciar desde 0 el servidor.
* El puerto abierto para este servicio es el 3000. Se optimiza la estructura para no necesitar un .env, pero en el futuro, por seguridad, lo correcto es usar uno.
