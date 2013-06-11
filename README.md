mxe
===

This is MXE (M cross environment) fork 

Changes:
- ICU4C builds shared (for using in shared Boost and Qt5)
- Boost builds shared and uses ICU (static Boost.Thread does not link, even with BOOST_THREAD_USE_LIB, when using DLL targets)
- Qt5 builds shared (License does not allow development of closed source statically linked applications)
