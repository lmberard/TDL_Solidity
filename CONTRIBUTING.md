## Compilacion y Deployment

La idea es clonear el repositorio en el Remix IDE para poder tener acceso a varios usuarios de prueba sin tener que utilizar dinero real y poder correr el programa directamente desde ahi. 

1. Abrir [REMIX IDE](remix.ethereum.org)
2. Instalar DGIT Plugin:

![image](https://user-images.githubusercontent.com/50753891/172474134-0d47c0bf-d6d1-43d1-8e10-60cf950cd9b1.png)

3. Crear un nuevo access token:

![image](https://user-images.githubusercontent.com/50753891/172474315-e9f943ca-c3b4-4161-9d95-5631accaa7d9.png)

4. Clonear el repositorio:

![image](https://user-images.githubusercontent.com/50753891/172474838-64df0b4c-dd13-4ed3-a545-f3a6fafaa4b2.png)

Esto permite poder tener todos los comandos de git y actualizar el repositorio directamente desde ahi.

5. Compilar el contrato

![image](https://user-images.githubusercontent.com/50753891/172475041-45aa5ef1-9b08-4822-ab9e-01e32014ed9d.png)

6. Deploy el contrato y correr las transacciones

![image](https://user-images.githubusercontent.com/50753891/172475205-d06b5b95-b807-498e-9a7e-82ad032784e4.png)

En cuento al environment para correrlo, vamos a usar JavaScript VM que nos permite tener varias cuentas (elegir cualquiera). Estos seran nuestros futuros `participantes` del juego
