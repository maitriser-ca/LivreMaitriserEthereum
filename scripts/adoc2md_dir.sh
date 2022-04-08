C3DIR=$1;

for C3FILE in $C3DIR/*.asciidoc; do
    C3NOEXT=${C3FILE%.asciidoc};

    asciidoc -b docbook $C3FILE;
    pandoc -f docbook -t markdown_strict ${C3NOEXT}.xml -o ${C3NOEXT}.md;
done;