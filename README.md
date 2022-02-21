# NES 64
A port of Commodore 64 KERNAL and BASIC ROMs to the Nintendo Entertainment System. Much like [Atari 64](https://github.com/unbibium/atari64), it shows off what's possible when you have two machines from the same era that run on roughly the same CPU.

This project is experimental and comes with no warranties, guarantees or any expectations that it serves any useful purpose. Try it at your on risk.

The KERNAL and ROM disassembly come from [Project 64 Reloaded](https://github.com/Project-64/reloaded), with annotations by Lee Davison.

You can build it yourself, or [download one of the releases](https://github.com/calcwatch/nes64/releases).

## How to Build
First, make sure you have `make` set up on your machine, and that you have the `cc65` package installed in your default path. You can get cc65 [here](https://cc65.github.io/). The project requires its assembler (`ca65`) and linker (`ld65`).

Then simply run `make` from the root directory. It will create a `rom/` subdirectory and put the ROM there.

## Current Status

NES 64 has been tested on [FCEUX](https://fceux.com/) 2.6.2 for macOS and [Nintendulator](https://www.qmtpro.com/~nes/nintendulator) 0.985 for 64bit Windows. It hasn't been confirmed to work on hardware yet. To run it on hardware, you'll need [MMC5](https://wiki.nesdev.org/w/index.php/MMC5) mapper support.

You should be able to type and run BASIC programs, but don't expect `POKE`, `PEEK` or `SYS` calls to work as they did on the real Commodore 64. The memory and hardware layouts are totally different.

Peripherals (the datasette drive, disk drive, RS232 devices, printers, modems, etc.) are not supported.

Text colors are not supported, unless you call out to machine language to change the palettes manually.

As on the real Commodore 64, you can toggle between all-caps and mixed case. You can do so by pressing "Esc + Shift". (Esc behaves like the "Commodore Key".)

As an bonus feature, you can inspect the output of NES controllers 1 and 2 with `PEEK(221)` and `PEEK(222)` respectively. See [NESDev documentation](https://wiki.nesdev.org/w/index.php?title=Controller_reading_code) for interpreting the output.

## Known Issues

The 32x30 character text screen will likely get cropped when displayed on a real TV. In the future, the window size may change to avoid this problem. FCEUX has an option to display the entire screen.

In Nintendulator, you'll see some flickering, especially during scrolling. This likely occurs on hardware as well. This is a side-effect of how the Extended RAM (ExRAM) used for the screen is being shared between the CPU and the PPU. Whenever the PPU is blocked from reading from the RAM, it prints the `@` character repeatedly. This can probably be fixed in the future with smarter read and write scheduling.

FCEUX 2.6.2 has [an issue](https://github.com/TASEmulators/fceux/issues/464) with keyboard support for shifted numbers and symbols. For example, nothing happens most of the time when pressing "shift+1" to type "!". To work around this, you can use the CTRL key (the "command" key on Macs) as a replacement for shift. This means that the usual Commodore CTRL key combinations are unavailable. (But many of those are for changing the text color, and that's not supported anyway.)

Lines of BASIC code can't span more than one screen line like on the Commodore 64. This may be fixed in the future.

You cannot use the CTRL key to slow down scrolling text output in BASIC. This may be fixed in the future.

## Key Mappings

As noted above, CTRL is just another shift key. In addition, since the Famicom and Commodore keyboards are not identical, other key substitutions had to be made:

| Commodore | Famicom |
| --- | -- |
| C= | Esc |
| £ | ¥ |
| ← | _ |
| ↑ | ^ |
| RESTORE | _Not supported_ |

_(The RESTORE key isn't part of the keyboard matrix -- it's wired directly to the CPU to trigger a non-maskable interrupt. So it can't be supported.)_
