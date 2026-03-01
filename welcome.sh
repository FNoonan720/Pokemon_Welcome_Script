#!/bin/bash

# Terminal Welcome Script
# Displays system information with colorful output and a random Pokemon

# Colors
RESET='\033[0m'
WHITE='\033[37m'
PALE_GREEN='\033[38;2;180;230;180m'

# Rainbow colors (each row gets the next color)
C_RED='\033[38;2;255;100;100m'
C_ORANGE='\033[38;2;255;180;100m'
C_YELLOW='\033[38;2;255;255;100m'
C_GREEN='\033[38;2;100;255;100m'
C_CYAN='\033[38;2;100;255;255m'
C_BLUE='\033[38;2;100;150;255m'
C_VIOLET='\033[38;2;200;100;255m'

# Path to the Pokemon CSV file (format: number,name)
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
POKEMON_CSV="$SCRIPT_DIR/pokemon.csv"

# ASCII art letter definitions (6 rows each)
declare -A LETTERS
LETTERS[A,0]=" █████╗ "
LETTERS[A,1]="██╔══██╗"
LETTERS[A,2]="███████║"
LETTERS[A,3]="██╔══██║"
LETTERS[A,4]="██║  ██║"
LETTERS[A,5]="╚═╝  ╚═╝"

LETTERS[B,0]="██████╗ "
LETTERS[B,1]="██╔══██╗"
LETTERS[B,2]="██████╔╝"
LETTERS[B,3]="██╔══██╗"
LETTERS[B,4]="██████╔╝"
LETTERS[B,5]="╚═════╝ "

LETTERS[C,0]=" ██████╗"
LETTERS[C,1]="██╔════╝"
LETTERS[C,2]="██║     "
LETTERS[C,3]="██║     "
LETTERS[C,4]="╚██████╗"
LETTERS[C,5]=" ╚═════╝"

LETTERS[D,0]="██████╗ "
LETTERS[D,1]="██╔══██╗"
LETTERS[D,2]="██║  ██║"
LETTERS[D,3]="██║  ██║"
LETTERS[D,4]="██████╔╝"
LETTERS[D,5]="╚═════╝ "

LETTERS[E,0]="███████╗"
LETTERS[E,1]="██╔════╝"
LETTERS[E,2]="█████╗  "
LETTERS[E,3]="██╔══╝  "
LETTERS[E,4]="███████╗"
LETTERS[E,5]="╚══════╝"

LETTERS[F,0]="███████╗"
LETTERS[F,1]="██╔════╝"
LETTERS[F,2]="█████╗  "
LETTERS[F,3]="██╔══╝  "
LETTERS[F,4]="██║     "
LETTERS[F,5]="╚═╝     "

LETTERS[G,0]=" ██████╗ "
LETTERS[G,1]="██╔════╝ "
LETTERS[G,2]="██║  ███╗"
LETTERS[G,3]="██║   ██║"
LETTERS[G,4]="╚██████╔╝"
LETTERS[G,5]=" ╚═════╝ "

LETTERS[H,0]="██╗  ██╗"
LETTERS[H,1]="██║  ██║"
LETTERS[H,2]="███████║"
LETTERS[H,3]="██╔══██║"
LETTERS[H,4]="██║  ██║"
LETTERS[H,5]="╚═╝  ╚═╝"

LETTERS[I,0]="██╗"
LETTERS[I,1]="██║"
LETTERS[I,2]="██║"
LETTERS[I,3]="██║"
LETTERS[I,4]="██║"
LETTERS[I,5]="╚═╝"

LETTERS[J,0]="     ██╗"
LETTERS[J,1]="     ██║"
LETTERS[J,2]="     ██║"
LETTERS[J,3]="██   ██║"
LETTERS[J,4]="╚█████╔╝"
LETTERS[J,5]=" ╚════╝ "

LETTERS[K,0]="██╗  ██╗"
LETTERS[K,1]="██║ ██╔╝"
LETTERS[K,2]="█████╔╝ "
LETTERS[K,3]="██╔═██╗ "
LETTERS[K,4]="██║  ██╗"
LETTERS[K,5]="╚═╝  ╚═╝"

LETTERS[L,0]="██╗     "
LETTERS[L,1]="██║     "
LETTERS[L,2]="██║     "
LETTERS[L,3]="██║     "
LETTERS[L,4]="███████╗"
LETTERS[L,5]="╚══════╝"

LETTERS[M,0]="███╗   ███╗"
LETTERS[M,1]="████╗ ████║"
LETTERS[M,2]="██╔████╔██║"
LETTERS[M,3]="██║╚██╔╝██║"
LETTERS[M,4]="██║ ╚═╝ ██║"
LETTERS[M,5]="╚═╝     ╚═╝"

LETTERS[N,0]="███╗   ██╗"
LETTERS[N,1]="████╗  ██║"
LETTERS[N,2]="██╔██╗ ██║"
LETTERS[N,3]="██║╚██╗██║"
LETTERS[N,4]="██║ ╚████║"
LETTERS[N,5]="╚═╝  ╚═══╝"

LETTERS[O,0]=" ██████╗ "
LETTERS[O,1]="██╔═══██╗"
LETTERS[O,2]="██║   ██║"
LETTERS[O,3]="██║   ██║"
LETTERS[O,4]="╚██████╔╝"
LETTERS[O,5]=" ╚═════╝ "

LETTERS[P,0]="██████╗ "
LETTERS[P,1]="██╔══██╗"
LETTERS[P,2]="██████╔╝"
LETTERS[P,3]="██╔═══╝ "
LETTERS[P,4]="██║     "
LETTERS[P,5]="╚═╝     "

LETTERS[Q,0]=" ██████╗ "
LETTERS[Q,1]="██╔═══██╗"
LETTERS[Q,2]="██║   ██║"
LETTERS[Q,3]="██║▄▄ ██║"
LETTERS[Q,4]="╚██████╔╝"
LETTERS[Q,5]=" ╚══▀▀═╝ "

LETTERS[R,0]="██████╗ "
LETTERS[R,1]="██╔══██╗"
LETTERS[R,2]="██████╔╝"
LETTERS[R,3]="██╔══██╗"
LETTERS[R,4]="██║  ██║"
LETTERS[R,5]="╚═╝  ╚═╝"

LETTERS[S,0]="███████╗"
LETTERS[S,1]="██╔════╝"
LETTERS[S,2]="███████╗"
LETTERS[S,3]="╚════██║"
LETTERS[S,4]="███████║"
LETTERS[S,5]="╚══════╝"

LETTERS[T,0]="████████╗"
LETTERS[T,1]="╚══██╔══╝"
LETTERS[T,2]="   ██║   "
LETTERS[T,3]="   ██║   "
LETTERS[T,4]="   ██║   "
LETTERS[T,5]="   ╚═╝   "

LETTERS[U,0]="██╗   ██╗"
LETTERS[U,1]="██║   ██║"
LETTERS[U,2]="██║   ██║"
LETTERS[U,3]="██║   ██║"
LETTERS[U,4]="╚██████╔╝"
LETTERS[U,5]=" ╚═════╝ "

LETTERS[V,0]="██╗   ██╗"
LETTERS[V,1]="██║   ██║"
LETTERS[V,2]="██║   ██║"
LETTERS[V,3]="╚██╗ ██╔╝"
LETTERS[V,4]=" ╚████╔╝ "
LETTERS[V,5]="  ╚═══╝  "

LETTERS[W,0]="██╗    ██╗"
LETTERS[W,1]="██║    ██║"
LETTERS[W,2]="██║ █╗ ██║"
LETTERS[W,3]="██║███╗██║"
LETTERS[W,4]="╚███╔███╔╝"
LETTERS[W,5]=" ╚══╝╚══╝ "

LETTERS[X,0]="██╗  ██╗"
LETTERS[X,1]="╚██╗██╔╝"
LETTERS[X,2]=" ╚███╔╝ "
LETTERS[X,3]=" ██╔██╗ "
LETTERS[X,4]="██╔╝ ██╗"
LETTERS[X,5]="╚═╝  ╚═╝"

LETTERS[Y,0]="██╗   ██╗"
LETTERS[Y,1]="╚██╗ ██╔╝"
LETTERS[Y,2]=" ╚████╔╝ "
LETTERS[Y,3]="  ╚██╔╝  "
LETTERS[Y,4]="   ██║   "
LETTERS[Y,5]="   ╚═╝   "

LETTERS[Z,0]="███████╗"
LETTERS[Z,1]="╚══███╔╝"
LETTERS[Z,2]="  ███╔╝ "
LETTERS[Z,3]=" ███╔╝  "
LETTERS[Z,4]="███████╗"
LETTERS[Z,5]="╚══════╝"

# Generate banner for a given username
generate_banner() {
    local username="${1^^}"  # Convert to uppercase
    local lines=("" "" "" "" "" "")

    for (( i=0; i<${#username}; i++ )); do
        local char="${username:$i:1}"
        if [[ -n "${LETTERS[$char,0]}" ]]; then
            for row in 0 1 2 3 4 5; do
                lines[$row]+="${LETTERS[$char,$row]}"
            done
        fi
    done

    # Print with gradient from white (255,255,255) to pale-green (180,230,180)
    local r g b
    for row in 0 1 2 3 4 5; do
        # Calculate gradient: row 0 = white, row 5 = pale-green
        r=$(( 255 - (255 - 180) * row / 5 ))
        g=$(( 255 - (255 - 230) * row / 5 ))
        b=$(( 255 - (255 - 180) * row / 5 ))
        echo -e "\033[38;2;${r};${g};${b}m ${lines[$row]}${RESET}"
    done
}

# Get temperature color on a gradient from blue (32°F) to red (85°F)
get_temp_color() {
    local temp="$1"
    local r g b

    if [ "$temp" -le 32 ]; then
        r=80; g=150; b=255
    elif [ "$temp" -ge 85 ]; then
        r=255; g=50; b=50
    elif [ "$temp" -le 50 ]; then
        local pct=$(( (temp - 32) * 100 / 18 ))
        r=$(( 80 + (255 - 80) * pct / 100 ))
        g=$(( 150 + (255 - 150) * pct / 100 ))
        b=255
    elif [ "$temp" -le 65 ]; then
        local pct=$(( (temp - 50) * 100 / 15 ))
        r=255; g=255
        b=$(( 255 - 255 * pct / 100 ))
    elif [ "$temp" -le 75 ]; then
        local pct=$(( (temp - 65) * 100 / 10 ))
        r=255
        g=$(( 255 - (255 - 165) * pct / 100 ))
        b=0
    else
        local pct=$(( (temp - 75) * 100 / 10 ))
        r=255
        g=$(( 165 - (165 - 50) * pct / 100 ))
        b=$(( 50 * pct / 100 ))
    fi
    echo "\033[38;2;${r};${g};${b}m"
}

# Weather location - set WELCOME_LOCATION environment variable to customize
# Example: export WELCOME_LOCATION="New York,NY"
WEATHER_LOCATION="${WELCOME_LOCATION:-}"

# Weather cache settings (line 1: location, line 2: weather data)
WEATHER_CACHE="$SCRIPT_DIR/.weather_cache"
WEATHER_CACHE_MAX_AGE=1800  # 30 minutes in seconds

# Update weather cache in background (fire and forget)
update_weather_cache() {
    [ -z "$WEATHER_LOCATION" ] && return
    local encoded_location="${WEATHER_LOCATION// /+}"
    (weather=$(curl -s --max-time 5 "wttr.in/${encoded_location}?format=%c+%t" 2>/dev/null) && printf '%s\n%s\n' "$WEATHER_LOCATION" "$weather" > "$WEATHER_CACHE.tmp" && mv "$WEATHER_CACHE.tmp" "$WEATHER_CACHE") &
    disown
}

# Fetch weather synchronously (used when no cache exists)
fetch_weather_sync() {
    [ -z "$WEATHER_LOCATION" ] && return
    local encoded_location="${WEATHER_LOCATION// /+}"
    local weather
    weather=$(curl -s --max-time 5 "wttr.in/${encoded_location}?format=%c+%t" 2>/dev/null)
    if [ $? -eq 0 ] && [ -n "$weather" ]; then
        printf '%s\n%s\n' "$WEATHER_LOCATION" "$weather" > "$WEATHER_CACHE.tmp" && mv "$WEATHER_CACHE.tmp" "$WEATHER_CACHE"
    fi
}

# Main display
main() {
    # Check if weather cache needs updating
    if [ -n "$WEATHER_LOCATION" ]; then
        local cached_location=""
        [ -f "$WEATHER_CACHE" ] && cached_location=$(head -1 "$WEATHER_CACHE")

        if [ ! -f "$WEATHER_CACHE" ]; then
            # First run: fetch synchronously so weather displays immediately
            fetch_weather_sync
        elif [ "$cached_location" != "$WEATHER_LOCATION" ]; then
            # Location changed: fetch fresh weather for new location
            fetch_weather_sync
        elif [ $(($(date +%s) - $(stat -c %Y "$WEATHER_CACHE" 2>/dev/null || echo 0))) -gt $WEATHER_CACHE_MAX_AGE ]; then
            # Cache expired: refresh in background so this login isn't blocked
            update_weather_cache
        fi
    fi

    # Get random Pokemon
    local pokemon
    if [ -f "$POKEMON_CSV" ]; then
        pokemon=$(shuf -n1 "$POKEMON_CSV" | cut -d',' -f2)
    else
        pokemon="pikachu"
    fi

    # 1/256 chance for shiny
    local is_shiny=0
    [ $((RANDOM % 256)) -eq 0 ] && is_shiny=1

    local variant="normal"
    [ $is_shiny -eq 1 ] && variant="shiny"

    # Start Pokemon sprite fetch in background
    local sprite_file="/tmp/pokemon_sprite_$$.png"
    curl -sf "https://img.pokemondb.net/sprites/home/${variant}/${pokemon}.png" -o "$sprite_file" 2>/dev/null &
    local sprite_pid=$!

    echo ""

    # Print username banner with gradient
    generate_banner "$(whoami)"

    # Wait for sprite and display
    wait $sprite_pid
    if [ -f "$sprite_file" ] && command -v chafa &> /dev/null; then
        chafa --size=20x10 --symbols=block "$sprite_file" 2>/dev/null | sed 's/^/                     /'
        rm -f "$sprite_file"

        # Pokemon name with title case
        local pokemon_display="${pokemon//-/ }"
        pokemon_display=$(echo "$pokemon_display" | sed 's/\b\(.\)/\u\1/g')
        [ $is_shiny -eq 1 ] && pokemon_display="$pokemon_display ✨"

        local name_len=${#pokemon_display}
        local padding=$(( (64 - name_len) / 2 ))
        printf "\r%${padding}s%s${RESET}\n" "" "$pokemon_display"
    fi

    echo ""

    # System info (fast local operations)
    printf "${WHITE}%-22s${RESET} ${C_ORANGE}%s${RESET}\n" "Today is:" "$(date '+%a, %b %d %Y %I:%M %p %Z')"

    if [ -f /etc/os-release ]; then
        . /etc/os-release
        printf "${WHITE}%-22s${RESET} ${C_YELLOW}%s${RESET}\n" "Operating System:" "$NAME $VERSION"
    fi

    printf "${WHITE}%-22s${RESET} ${C_GREEN}%s${RESET}\n" "Processor:" "$(grep -m1 'model name' /proc/cpuinfo | cut -d: -f2 | sed 's/^ //')"

    printf "${WHITE}%-22s${RESET} ${C_CYAN}%s${RESET}\n" "Kernel Information:" "$(uname -r)"

    # Memory info
    read -r _ total used _ _ _ available _ <<< "$(free -m | grep '^Mem:')"
    local percent=$((used * 100 / total))
    printf "${WHITE}%-22s${RESET} ${C_BLUE}Used %s MB of %s MB (%s%%)${RESET}\n" "Memory Usage:" "$used" "$total" "$percent"
    printf "${WHITE}%-22s${RESET} ${C_BLUE}%s MB available${RESET}\n" "" "$available"

    # Display weather (only if cache matches current location)
    local display_cached_location=""
    [ -f "$WEATHER_CACHE" ] && display_cached_location=$(head -1 "$WEATHER_CACHE")
    if [ -n "$WEATHER_LOCATION" ] && [ -f "$WEATHER_CACHE" ] && [ "$display_cached_location" = "$WEATHER_LOCATION" ]; then
        local weather_data
        weather_data=$(sed -n '2p' "$WEATHER_CACHE")
        weather_data="${weather_data//+/}"  # Remove plus signs

        if [ -n "$weather_data" ] && [ "$weather_data" != "N/A" ]; then
            local temp_num=$(echo "$weather_data" | grep -oE '[-]?[0-9]+' | head -1)
            if [ -n "$temp_num" ]; then
                local temp_color=$(get_temp_color "$temp_num")
                local icon
                icon=$(echo "$weather_data" | sed 's/[0-9-].*//' | sed 's/ *$//')
                local temp_with_unit=$(echo "$weather_data" | grep -oE '[-]?[0-9]+°[CF]')
                printf "${WHITE}%-22s${RESET} %s ${temp_color}%s${RESET} ${C_VIOLET}(%s)${RESET}\n" "Weather:" "${icon}" "${temp_with_unit}" "${WEATHER_LOCATION}"
            fi
        fi
    elif [ -z "$WEATHER_LOCATION" ]; then
        # Show hint when WELCOME_LOCATION is not set
        printf "${WHITE}%-22s${RESET} ${C_VIOLET}%s${RESET}\n" "Weather:" "export WELCOME_LOCATION=\"New York,NY\""
    fi

    echo ""
    echo -e "Have a great day, ${PALE_GREEN}$(whoami)${RESET}!"
    echo ""
}

main
