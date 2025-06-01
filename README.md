---
---

````markdown
# scripts

Repositorio de utilidades y scripts Bash reutilizables para automatización, administración y solución de problemas comunes en sistemas Linux/Unix.

La idea es centralizar aquí todos los scripts que vaya desarrollando, cada uno enfocado en resolver una necesidad específica, con buenas prácticas, modularidad y documentación clara para facilitar su integración y extensión.

---

## Scripts disponibles

### 1. `logging.sh` — Logging estructurado y multinivel para Bash

Módulo de logging inspirado en Python, pensado para dotar a tus scripts Bash de trazabilidad, control de niveles y salidas estructuradas tanto en consola como en archivos.

**Características principales:**

- Niveles de log: `DEBUG`, `INFO`, `WARNING`, `ERROR`, `CRITICAL`
- Salida en consola con colores y en archivos separados por fecha y contexto
- Configuración de modo de escritura (`append` o `write`)
- Fácil integración vía `source` en cualquier script Bash

#### Uso básico

```bash
# Variables de configuración
NIVEL="info"      # Nivel mínimo a mostrar (debug, info, warning, error, critical)
MODO="w"          # Modo de archivo: 'a' para append, 'w' para sobrescribir
NOMBRE="MI_PROCESO" # Nombre identificador para el archivo de log

# Cargar el módulo de logging
source ./logging.sh "$NIVEL" "$MODO" "$NOMBRE"

# Ejemplo de uso
log_debug "Mensaje de depuración"
log_info "Mensaje informativo"
log_warning "Mensaje de advertencia"
log_error "Mensaje de error"
log_critical "Mensaje crítico"
```
````

Consulta el script [`prueba_logging.sh`](./prueba_logging.sh) para ver un ejemplo completo de integración.

---

## Estructura del repositorio

- Cada script es autocontenible y documentado en su cabecera.
- Los módulos reutilizables (como `logging.sh`) están pensados para ser integrados vía `source`.
- Los ejemplos de uso y pruebas rápidas se encuentran en archivos `prueba_<nombre>.sh`.

---

## Próximos scripts

Este repositorio crecerá con nuevos módulos y utilidades para:

- Gestión de backups
- Automatización de tareas recurrentes
- Y cualquier otra solución que surja en el día a día

---

## Contribuciones

Si tienes ideas, mejoras o encuentras algún bug, siéntete libre de abrir un issue o enviar un pull request.  
La meta es construir una colección robusta y práctica de utilidades Bash para la comunidad.

---
