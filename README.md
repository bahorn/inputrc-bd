# inputrc backdoor poc

just an example on how to use `.inputrc` as a backdoor, by injecting a command
to be ran by bash after you press enter.

If you aren't familar with what this file is for, its a
[configuration file for GNU readline](https://www.gnu.org/software/bash/manual/html_node/Readline-Init-File.html)
You can use it to configure how readline handles certain characters and set
various configuration options as well.
This just uses it to override the handler for enter, adding in a command to run
afterwards.

the resulting `.inputrc` is self contained, having your payload embedded.

Cleans up by:
* deleting $HOME/.inputrc
* removes the last three lines to hide the commands we ran
* removes the last line of history
* restores the enter key

If you type something like `"""` into bash for the first command this will leak
what its trying to do when you press enter.
Not really an obvious way to fix that however.

This also was used as the basis for a [BGGP6 entry](./bggp).

## Usage

Modify `payload.sh` to do what you want, then just run `make` and you'll have a
`.inputrc` to use.

You can test quickly by running just `make test`.

## License

MIT
