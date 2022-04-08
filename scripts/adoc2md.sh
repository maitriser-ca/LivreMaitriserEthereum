C3FILE=$1;
FN=${C3FILE%.asciidoc};
asciidoc -b docbook $C3FILE;
pandoc -f docbook -t markdown_strict ${FN}.xml -o ${FN}.md;
