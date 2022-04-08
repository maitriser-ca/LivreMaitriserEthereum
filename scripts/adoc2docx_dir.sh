C3DIR=$1;

for C3FILE in $C3DIR/*.asciidoc; do
    
    asciidoctor --backend docbook --out-file - $C3FILE | pandoc --from docbook --to docx --output $C3FILE.docx;
done;