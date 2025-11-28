cp inputrc.tmpl .inputrc
cat payload.sh | \
    base64 -w 0 | \
    xargs -I{} echo "# ////{}" >> .inputrc
