C3DIR=$1;

for C3FILE in $C3DIR/*.asciidoc; do
    asciidoctor $C3FILE;
done;