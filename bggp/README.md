# `.inputrc` for BGGP{3,4,5,6} (126 bytes)

If you are like me you have probably never heard of a `inputrc`.
Its a configuration format for GNU readline, and lets you setup keybindings and
change line editing behaviour.
Lots of tools use it, including bash (which this entry focuses on).

## Entry

Raw (beware of a stray newline):
```
C-m:"\necho 6;curl -L binary.golf/6/6;cp .inputrc 6;bind 'set keymap vi';bind -f.inputrc\n"
$if keymap == vi
$include .inputrc
```

Base64:
```
Qy1tOiJcbmVjaG8gNjtjdXJsIC1MIGJpbmFyeS5nb2xmLzYvNjtjcCAuaW5wdXRyYyA2O2JpbmQgJ3NldCBrZXltYXAgdmknO2JpbmQgLWYuaW5wdXRyY1xuIgokaWYga2V5bWFwID09IHZpCiRpbmNsdWRlIC5pbnB1dHJj
```

SHA256:
```
d679bc511e153a2b8aba86655ed3d9c0b63dd7ba3929c16ccd78bdf74e432a5f
```

Tested on a Ubuntu 24.04 box with bash 5.2.21, readline 8.2-4build1 (according
to apt).

## Usage

Run this with:
```
cp inputrc .inputrc
HOME=`pwd` bash
```

This assumes you are in `$HOME` and the `.inputrc` is in `$HOME` to save space
on paths.

Press enter once and the entry should do its magic:
* echo 6
* download and display the bggp5 file
* copy itself to 6
* crash!

Example output:
```
$ HOME=`pwd` bash
To run a command as administrator (user "root"), use "sudo <command>".
See "man sudo_root" for details.
a@md:~$
a@md:~$ echo 6;curl -L binary.golf/6/6;cp ~/.inputrc 6;bind 'set editing-mode vi';bind -f~/.inputrc
6
Another #BGGP6 download!!!!!! Hi @binarygolf https://binary.golf/6
[1]    462255 segmentation fault (core dumped)  HOME=`pwd` bash
```

## Tricks

* Crashing GNU Readline with an infinite recursion (not a bug that is
  exploitable sadly/thankfully).
* Replacing enter with a set of commands to be ran by bash.
* Changing the keymap and reloading to trigger the crash with commands ran
  by bash. This assumes you keymap is not `vi` initially, which should be the
  case on ubuntu 24.04.
* not including an unneeded `$endif`, the format lets you skip it.
* `truncate -s -1` to save a newline.

## Notes

I thought `inputrc`s made for a kinda interesting backdoor approach but I've
never really seen it documented.
I do think some other people are aware of it though, mainly as there was a very
tiny reference to checking them for forensics reasons in a
[presentation by the crowdstrike guys in 2016](https://papers.put.as/papers/macosx/2016/exp-r04_hacking_exposed_the_mac_attack.pdf)
(slide 25).

See the [root of this repo](https://github.com/bahorn/inputrc-bd/) for an
implementation with all the cleanup required.
Slightly noisy so maybe alias tricks are still the better approach.

There was a kinda cool [CVE from 2022 in `linux-utils`](https://lore.kernel.org/util-linux/20220214110609.msiwlm457ngoic6w%40ws.net.home/T/#u)
, where they used the INPUTRC environment variable with SUID binaries to leak
file contents.
Doesn't expose too much, but cool idea.
Would not be suprised if there are variants of that one around still, especially
on the weirder *NIXs.

Only found out about this file format yesterday (2025-11-28) when trying to do
research on what randon weird files my box uses.
Still wanna find something that can do cool stuff without needing to shell out.
