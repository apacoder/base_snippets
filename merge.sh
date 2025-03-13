#!/bin/bash

# Archivo de salida
OUTPUT_FILE="../merged-uca.code-snippets"

# Iniciar el archivo JSON
echo "{" > "$OUTPUT_FILE"

# Contador para manejar la coma entre objetos JSON
FIRST=true

# Iterar sobre todos los archivos .code-snippets en el directorio actual
for file in *.code-snippets; do
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
echo "}" >> "$OUTPUT_FILE"

echo "✅ Se han fusionado los snippets en $OUTPUT_FILE"
