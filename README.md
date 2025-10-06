1. Prerrequisitos:

   - Sistema operativo: Windows 11
   - IntelliJ IDEA: versión 2025.2.3
   - Maven versión 3.9.11 (debe estar en la variable de entorno)
   - JDK versión 17.0.12 (debe estar en la variable de entorno JAVA_HOME)
   - Karate versión 1.4.1 (dependencia definida en el pom.xml)
   - JUnit 5 (a través de karate-junit5)
   - AssertJ Core versión 3.24.2

2. Comandos de instalación

   - mvn clean install -DskipTests
   - mvn dependency:resolve
   - mvn compile

3. Instrucciones para ejecutar los test

   Desde IntelliJ IDEA:
       - Abrir el proyecto
       - Hacer clic derecho sobre el archivo PetStoreRunner.java y seleccionar "Run"

   Desde terminal:
       - mvn test

   Reportes generados:
       - target/surefire-reports/
       - target/karate-reports/karate-summary.html

4. Información adicional

   - El endpoint público PetStore (https://petstore.swagger.io/v2) puede presentar inconsistencias.
   - El endpoint /pet/findByStatus no siempre refleja inmediatamente las actualizaciones realizadas vía PUT.
   - Para garantizar la validez de las pruebas, se recomienda siempre verificar el estado de la mascota con GET /pet/{id}.
   - Para asegurar que la mascota haya cambiado de status a "sold", se hace una verificación final a través del ID, porque no hay un endpoint directo que funcione con ID y Status.

