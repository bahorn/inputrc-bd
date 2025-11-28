# inputrc backdoor poc

just an example on how to use `.inputrc` as a backdoor, by injecting a command
to be ran by bash after you press enter.

the resulting `.inputrc` is self contained, having your payload embedded.

Cleans up by:
* deleting $HOME/.inputrc
* removes the last three lines to hide the commands we ran
* removes the last line of history
* restores the enter key

## Usage

Modify `payload.sh` to do what you want, then just run `make` and you'll have a
`.inputrc` to use.

You can test quickly by running just `make test`.

## License

MIT
