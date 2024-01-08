# isowrt

Easy way to burn a bootable flash drive with ISO.

### lotigara's notes:
Changes:
- added support for files with spaces in the name
- using pv and shell instead of dd
#### TODO for this fork
- ~~Add support for files with spaces in the name~~
- Add support for more directories (not just `~/`)

# Available OS

**All UNIX *(and UNIX-like)* systems with Bash installed are supported.**

## Install
First, you need to install `bash` (Bourne-Again Shell). It usually located in `bash` package, see your distribution instructions.
And you also need to install `pv`, it is needed to writing the image. I use `pv` in this script because it faster.

And now, you can clone and install (or try) this script by running:
```bash
git clone https://github.com/lotigara/isowrt.git
cd isowrt
chmod +x install.sh
chmod +x isowrt.sh
./install.sh # (or isowrt.sh if you want to try this script before installation)
```
## TODO
- Add PKGBUILD for ArchLinux

# License

[**GNU GPL v3**](./LICENSE.md)
