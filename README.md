# Odin shared library usage example

In this repository, you can see how to structure projects that are divided into
an executable and shared libraries.

This is a common practice for large projects, used to avoid bloating the
executable file or to reuse the same logic for multiple purposes without duplicating
symbols.

In Odin, creating such an architecture is just as simple as it is in
C/C++, perhaps even simpler, in fact. You don't need to write export/import
macros; you simply mark a symbol as exported and add an interface (a bindings
package). Linking is handled by an interface package via `foreign import`.
