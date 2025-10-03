#!/usr/bin/env bash

TEMP_FILE="$(mktemp)"
IGNORE_PATTERNS=()
SEARCH_PATTERN=""
FILES=()
declare -A SEEN   # to track visited files

# Show help
usage() {
    cat << EOF
collect-files - Collect and concatenate files into a single temp file

USAGE:
      collect-files [options] [paths...]

OPTIONS:
      -p, --pattern <pattern>   Search for files matching pattern (uses 'fd' or 'find')
      -i, --ignore <pattern>    Ignore files or directories containing pattern
      -h, --help                Show this help message

EXAMPLES:
      collect-files -p "*.sh"               # Collect all .sh files
      collect-files src/ -i "test"          # Walk src/ but ignore paths containing 'test'
      collect-files file1.txt file2.txt     # Explicitly include given files

OUTPUT:
      All collected file contents are written into a temp file like `$TEMP_FILE`
EOF
}

print_to () {
    local filename="$1"
    {
        echo
        echo "======================"
        echo "$filename"
        echo "======================"
        cat "$filename"
    } >> "$TEMP_FILE"
}

should_ignore () {
    local f="$1"
    for pat in "${IGNORE_PATTERNS[@]}"; do
        if [[ "$f" == *"$pat"* ]]; then
            return 0
        fi
    done
    return 1
}

walk () {
    local path="$1"
    local depth="${2:-0}"

    if should_ignore "$path"; then
        return
    fi

    if [ -d "$path" ]; then
        if (( depth < 5 )); then
            for f in "$path"/*; do
                [ -e "$f" ] || continue
                walk "$f" \$((depth+1))
            done
        fi
    elif [ -f "$path" ]; then
        # Deduplication check
        if [[ -z "${SEEN["$path"]}" ]]; then
            SEEN["$path"]=1
            print_to "$path"
        fi
    fi
}

while [[ $# -gt 0 ]]; do
    case "$1" in
        -p|--pattern)
            SEARCH_PATTERN="$2"
            shift 2
            ;;
        -i|--ignore)
            IGNORE_PATTERNS+=("$2")
            shift 2
            ;;
        -h|--help)
            usage
			rm "$TEMP_FILE"
            exit 0
            ;;
        *)
            FILES+=("$1")
            shift
            ;;
    esac
done

if [[ -n "$SEARCH_PATTERN" ]]; then
    if command -v fd >/dev/null 2>&1; then
        mapfile -t new_files < <(fd --type f "$SEARCH_PATTERN")
        FILES+=("${new_files[@]}")
    else
        mapfile -t new_files < <(find . -type f -name "*$SEARCH_PATTERN*")
        FILES+=("${new_files[@]}")
    fi
fi

for f in "${FILES[@]}"; do
    walk "$f" 0
done

echo "Output written to: $TEMP_FILE"

