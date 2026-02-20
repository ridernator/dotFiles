newScript() {
  local -r scriptName="$1"

  if test ! -e "$scriptName"; then
    echo "#!/usr/bin/env bash"        >> "$scriptName"
    echo                              >> "$scriptName"
    echo "cd \"\$(dirname \"\$0\")\"" >> "$scriptName"
    echo                              >> "$scriptName"
    echo "main() {"                   >> "$scriptName"
    echo "  :"                        >> "$scriptName"
    echo "}"                          >> "$scriptName"
    echo                              >> "$scriptName"
    echo "main \"\$@\""               >> "$scriptName"

    chmod +x "$scriptName"
  else
    echo "$scriptName already exists"

    return 1
  fi
}
