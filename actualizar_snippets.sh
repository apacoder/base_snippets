#!/bin/bash

# Archivo de salida
FILE_NAME="custom-user.code-snippets"
OUTPUT_FILE="$HOME/.config/Code/User/snippets/$FILE_NAME"

# Iniciar el archivo JSON
echo "{" > "$OUTPUT_FILE"

# Contador para manejar la coma entre objetos JSON
FIRST=true

# Iterar sobre todos los archivos .code-snippets en el directorio actual
for file in snippets/*.code-snippets; do
    if [[ "$file" == "$OUTPUT_FILE" ]]; then
        continue
    fi

    # Extraer solo el contenido del objeto JSON sin las llaves externas
    CONTENT=$(sed '1d;$d' "$file") 

    if [ "$FIRST" = true ]; then
        FIRST=false
    else
        echo "" >> "$OUTPUT_FILE"
    fi

    echo "$CONTENT" >> "$OUTPUT_FILE"

done

# Cerrar el JSON

# Copiar el contenido de la variable $OUTPUT_FILE al archivo de salida
echo "}" >> "$OUTPUT_FILE"

echo "✅ Se han fusionado los snippets en $OUTPUT_FILE"
