#!/usr/bin/env bash

add() {
    local url=$1

    ../packwiz/packwiz mr add "$url"
}

add $@
