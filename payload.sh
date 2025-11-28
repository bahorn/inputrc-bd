# cleanup
clear_this_line(){
        printf '\r'
        cols="$(tput cols)"
        for i in $(seq "$cols"); do
                printf ' '
        done
        printf '\r'
}

clear_this_line
printf '\033[1A'
clear_this_line
printf '\033[1A'
clear_this_line
bind '\C-m':accept-line
history -d -1
rm $HOME/.inputrc

# now you can do whatever you want
echo pwned
