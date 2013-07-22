mxe
===

This is MXE (M cross environment) fork 

Changes:

- **gdb** builds native with win32 target and win32 to allow remote debugging
- **gcc** builds with shared runtime libraries
- **ICU4C** builds shared (for using in shared **Boost** and **Qt5**)
- **Boost** builds shared and uses ICU (static Boost.Thread does not link, even with BOOST\_THREAD\_USE\_LIB, when using DLL targets)
- **Qt5** builds shared (License does not allow development of closed source statically linked applications)
- Added **OpenBLAS** package
