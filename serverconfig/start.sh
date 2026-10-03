#/usr/bin/env bash

set -euo pipefail

RED="\033[31m"
GREEN="\033[32m"
YELLOW="\033[33m"
BLUE="\033[34m"
RESET="\033[0m"

__msg_print() {
    local color=$1
    local level=$2
    local msg=$3
    shift 3

    printf "${color}[$level] $msg${RESET}\n" "$@"
}

msg_debug() {
    __msg_print "$GREEN" "DEBUG" "$1" "${@:2}"
}
msg_info() {
    __msg_print "$BLUE" "INFO" "$1" "${@:2}"
}
msg_warn() {
    __msg_print "$YELLOW" "WARN" "$1" "${@:2}"
}
msg_error() {
    __msg_print "$RED" "ERROR" "$1" "${@:2}"
}

if ! command -v java > /dev/null 2>&1; then
    msg_error "Java is not installed, please installed java 21+ to run the server."
    exit 1
fi

NEOFORGE_VERSION="21.1.252"
NEOFORGE_INSTALLER="neoforge-${NEOFORGE_VERSION}-installer.jar"
NEOFORGE_URL="https://maven.neoforged.net/releases/net/neoforged/neoforge/${NEOFORGE_VERSION}/${NEOFORGE_INSTALLER}"

msg_debug "NEOFORGE_INSTALLER=${NEOFORGE_INSTALLER}"
msg_debug "NEOFORGE_URL=${NEOFORGE_URL}"

if [[ ! -f "${NEOFORGE_INSTALLER}" ]]; then
    msg_info "Missing neoforge installer, downloading..."
    if command -v curl > /dev/null 2>&1; then
        msg_info "curl: Downloading neoforge installer."
        if ! curl -o "${NEOFORGE_INSTALLER}" "${NEOFORGE_URL}" > /dev/null 2>&1; then
            msg_error "wget: Failed to download neoforge instlaler"
            exit 1
        fi
    elif command -v wget > /dev/null 2>&1; then
        msg_info "wget: Downloading neoforge installer."
        if ! wget -O "${NEOFORGE_INSTALLER}" "${NEOFORGE_URL}" > /dev/null 2>&1; then
            msg_error "wget: Failed to download neoforge instlaler"
            exit 1
        fi
    else
        msg_error "Neither curl nor wget installed."
        exit 1
    fi
fi

NEOFORGE_LIBRARIES="libraries"

if [[ ! -d "${NEOFORGE_LIBRARIES}" ]]; then
    msg_info "Missing neoforge libraries, extracting..."
    if ! java -jar ${NEOFORGE_INSTALLER} --installServer > /dev/null 2>&1; then
        msg_error "Failed to extract neoforge libraries."
        exit 1
    fi
fi

CLEANUP_FILES=("run.sh" "run.bat")

for file in "${CLEANUP_FILES[@]}"; do
    msg_debug "Iterating file=${file}"
    if [[ -f "${file}" ]]; then
        msg_info "Deleting ${file}"
        rm -- "${file}"
    fi
done

java "@user_jvm_args.txt" "@libraries/net/neoforged/neoforge/${NEOFORGE_VERSION}/unix_args.txt" nogui
