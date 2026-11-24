# SDL3 with V

This starter opens a resizable SDL3 window and redraws it when its pixel size changes or when the window is exposed. Close the window to exit.

You need V, a C compiler, and SDL3 3.4 development files discoverable by `pkg-config`. On Arch Linux and Omarchy, the `sdl3` package provides those files. Install the official V bindings in the project with the SDL3 branch.

```sh
git clone --depth 1 --branch 3.4.0 https://github.com/vlang/sdl.git modules/sdl
```

```sh
v run .
```

To build an executable in the current directory, run `v .`.
