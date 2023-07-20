## Comandos
 - Aumentar (5 em 5)
    ```
    powershell -ExecutionPolicy Bypass -File main.ps1 -Increment
    ```
    - Valor diferente
      ```
      powershell -ExecutionPolicy Bypass -File main.ps1 -Increment -Brightness {{value}}
      ```
 - Diminuir (5 em 5)
   ```
   powershell -ExecutionPolicy Bypass -File main.ps1
   ```
   - Valor diferente
     ```
     powershell -ExecutionPolicy Bypass -File main.ps1 -Brightness {{value}}
     ```
 - Colocar valor desejado
     ```
     powershell -ExecutionPolicy Bypass -File main.ps1 -BrightnessReset -Brightness {{value}}
     ```
