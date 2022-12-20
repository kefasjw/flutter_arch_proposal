allDirs() {
    # shellcheck disable=SC2207
    dirs=($(find . -maxdepth 2 -type d))
    for dir in "${dirs[@]}"; do
        $1 "$dir"
    done
}

runGet() {
    cd "$1" || exit
    if [ -f "pubspec.yaml" ]; then
        flutter packages get
    fi
    cd - > /dev/null || exit
}

allDirs "runGet"