.import NES_MAPPER, NES_PRG_BANKS, NES_CHR_BANKS, NES_MIRRORING, NES_PRG_RAM

.segment        "HEADER"
        .byte   "NES",$1a                               ; "NES"^Z
        .byte   <NES_PRG_BANKS                          ; ines prg  - Specifies the number of 16k prg banks.
        .byte   <NES_CHR_BANKS                          ; ines chr  - Specifies the number of 8k chr banks.
        .byte   <NES_MIRRORING | (<NES_MAPPER << 4)     ; ines mir  - Specifies VRAM mirroring of the banks.
        .byte   (<NES_MAPPER & $f0) | $08               ; ines map  - Specifies the NES mapper used and declares this as a NES 2.0 header
        .byte   0                                       ; Mapper MSB/Submapper
        .byte   0                                       ; PRG-ROM/CHR-ROM size MSB 
        .byte   <NES_PRG_RAM                            ; RAM size = 64 ** NES_PRG_RAM
        .byte   0,0,0,0                                 ; Unused settings
        .byte   $23                                     ; Uses Family BASIC keybaord
