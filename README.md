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

# Install

```bash
git clone https://github.com/lotigara/isowrt.git
cd isowrt
chmod +x install.sh
./install.sh
```
# TODO
- Add PKGBUILD for ArchLinux

# License

[**GNU GPL v3**](./LICENSE.md)
