#!/usr/bin/env bash

PACKWIZ=packwiz

add() {
    local url=$1

    $PACKWIZ mr add "$url"
}

add $@

unset PACKWIZ
