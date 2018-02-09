#!/usr/bin/env bash
dir="$(dirname "$0")"
bin="$(basename "$0")"
exec -a "$0" "$dir/bundled/lib/ld-linux-x86-64.so.2" --library-path "$dir/bundled/lib" "$dir/bundled/$bin" "$@"
