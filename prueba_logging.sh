#!/bin/bash

# Variables de configuración
NIVEL="info"
MODO="w"
NOMBRE="PRUEBA_OTRO_ARCHIVO"

# Carga el módulo de logging con los parámetros deseados
source ./logging.sh "$NIVEL" "$MODO" "$NOMBRE"

log_debug "Esto es un mensaje de depuración (debug). otro archivo"
log_info "Esto es un mensaje informativo otro archivo"
log_warning "Esto es un mensaje de advertencia otro archivo"
log_error "Esto es un mensaje de error otro archivo"
log_critical "Esto es un mensaje CRITICO otro archivo"
