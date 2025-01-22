#!/bin/bash

MONITORED_DIR="$1"
TEMP_FILE="/tmp/file_sizes.tmp"
du -sh "$1"
calculate_sizes() {
    find "$MONITORED_DIR" -type f -exec du -h {} \; > "$TEMP_FILE"
}

monitor_files() {
    calculate_sizes
    while true; do
        inotifywait -e modify,close_write "$MONITORED_DIR" > /dev/null 2>&1
        find "$MONITORED_DIR" -type f | while read -r file; do
            old_size=$(grep -F "$file" "$TEMP_FILE" | awk '{print $1}')
            new_size=$(du -h "$file" | awk '{print $1}')
            
            if [[ -z "$old_size" ]] || [[ -z "$new_size" ]]; then
                continue
            fi

            old_size_bytes=$(echo "$old_size" | numfmt --from=iec)
            new_size_bytes=$(echo "$new_size" | numfmt --from=iec)

            increase=$((new_size_bytes - old_size_bytes))
            threshold=$((old_size_bytes / 10))

            if [ "$increase" -gt "$threshold" ]; then
                echo "File size increased by 10% or more: $file"
                echo "Old size: $old_size"
                echo "New size: $new_size"
                echo "Increase: $(numfmt --to=iec $increase)"
            fi
        done
        calculate_sizes
        check_disk_usage
    done
}

check_disk_usage() {
    echo "Disk usage for $MONITORED_DIR:"
    du -sh "$MONITORED_DIR"
    echo
}

monitor_files

