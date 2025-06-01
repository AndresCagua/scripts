#!/bin/bash

#==========================
# Logging estilo Python para Bash
# =========================

# Niveles de log válidos
LOG_LEVELS=("DEBUG" "INFO" "WARNING" "ERROR" "CRITICAL")

# Leer parámetros
USER_LOG_LEVEL="${1^^}" # Primer parámetro, en mayúsculas
USER_LOG_MODE="${2,,}"  # Segundo parámetro, en minúsculas
PARAMETER_NAME="${3^^}" # Tercer parámetro, en mayúsculas

BASE_NAME="${PARAMETER_NAME:-LOG}"
LOG_LEVEL="${USER_LOG_LEVEL:-INFO}"
LOG_FILE_MODE="${USER_LOG_MODE:-a}"

# Validar y asignar modo de archivo si se pasa como parámetro
if [[ "$USER_LOG_MODE" == "w" || "$USER_LOG_MODE" == "a" ]]; then
    LOG_FILE_MODE="$USER_LOG_MODE"
fi

# Colores para cada nivel
COLOR_DEBUG="\033[0;36m"
COLOR_INFO="\033[0;32m"
COLOR_WARNING="\033[0;33m"
COLOR_ERROR="\033[0;31m"
COLOR_CRITICAL="\033[1;41m"
COLOR_RESET="\033[0m"

# Configuración de salida
LOG_DIR="logs/$(date '+%Y-%m')"
mkdir -p "$LOG_DIR"
LOG_FILE="${LOG_DIR}/salida_${BASE_NAME}_$(date '+%Y%m%d_%H%M').log"
LOG_TO_FILE=true
LOG_TO_CONSOLE=true

# Inicialización del archivo de log según el modo
if [[ "$LOG_TO_FILE" == true ]]; then
    if [[ "$LOG_FILE_MODE" == "w" ]]; then
        : > "$LOG_FILE"
    fi
fi

# Función principal de log
log() {
    local level="$1"
    shift
    local msg="$*"
    local level_index=-1
    local current_index=-1

    # Buscar el índice del nivel actual y del mensaje
    for i in "${!LOG_LEVELS[@]}"; do
        [[ "${LOG_LEVELS[$i]}" == "$level" ]] && level_index="$i"
        [[ "${LOG_LEVELS[$i]}" == "$LOG_LEVEL" ]] && current_index="$i"
    done

    # Si el nivel del mensaje es mayor o igual al configurado, lo mostramos
    if [[ $level_index -ge $current_index ]]; then
        local color_var="COLOR_${level}"
        local color="${!color_var:-$COLOR_RESET}"
        local output="[$(date '+%Y-%m-%d %H:%M:%S')] [$level] $msg"

        if [[ $LOG_TO_CONSOLE == true ]]; then
            echo -e "${color}${output}${COLOR_RESET}"
        fi
        if [[ $LOG_TO_FILE == true ]]; then
            echo "$output" >> "$LOG_FILE"
        fi

    fi

}

# Funciones por nivel
log_debug() { log "DEBUG" "$@"; }
log_info() { log "INFO" "$@"; }
log_warning() { log "WARNING" "$@"; }
log_error() { log "ERROR" "$@"; }
log_critical() { log "CRITICAL" "$@"; }

# ==============================
# Ejemplo de uso
# ==============================

# log_debug "Esto es un mensaje de depuración (debug). "
# log_info "Esto es un mensaje informativo"
# log_warning "Esto es un mensaje de advertencia "
# log_error "Esto es un mensaje de error "
# log_critical "Esto es un mensaje CRITICO"
