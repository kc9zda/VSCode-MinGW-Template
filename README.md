# VSCode Windows C/C++ Template

Joseph Havens, 2023

# Before using this template

The prerequisites and following steps are only necessary when initializing the template

## MinGW

You will need to have a MinGW G++ compiler (either 32 or 64 bit). The included build task expects to find GNU make as `mingw32-make`. This can be changed in `tasks.json`.
It is also necessary to have access to basic Linux shell commands such as `rm` and `mkdir`. 

## launch.json

In the `(gdb) Launch` configuration change the name of the `"program"` to the one you are making. For example if you are making `helloworld.exe`, the configuration should say `${workspaceFolder}/helloworld.exe`.

## Resources and Manifests

Some Windows programs require resources or a manifest. A basic resource file `*.rc` and a manifest file `*.manifest` are included. These files should have the same file name (minus extension) as the main executable. For example, if your executable is `helloworld.exe`, your resource file should be `helloworld.rc`. It is also recommended to change the name of the manifest file to `helloworld.exe.manifest` and update the reference in `helloworld.rc`.

# Source Files

Source files are put in the `src` directory and must have a `.cpp` extension, even if only using C features. Headers can also be included with the source files and should have a `.h` extension. Subdirectories are allowed and require no changes to the Makefile.

# Building

Press **Ctrl+Shift+B** to manually build the project. In the terminal you can run `mingw32-make clean` to remove all compiled files, and the entire project will be rebuilt on the next build. The project will automatically build any updated source files when launching the program.

# Running and Debugging

Press **F5** to debug the program. Any source files that were updated will be rebuilt.

# Rebuilding

Run `mingw32-clean` then build using **Ctrl+Shift+B**, using `mingw32-make` in the terminal, or debugging the program (which will build automatically)

# License

Released under MIT License. See LICENSE for details.