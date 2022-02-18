.import NES_MAPPER, NES_PRG_BANKS, NES_CHR_BANKS, NES_MIRRORING

.segment        "HEADER"
        .byte   "NES",$1a                               ; "NES"^Z
        .byte   <NES_PRG_BANKS                          ; ines prg  - Specifies the number of 16k prg banks.
        .byte   <NES_CHR_BANKS                          ; ines chr  - Specifies the number of 8k chr banks.
        .byte   <NES_MIRRORING | (<NES_MAPPER << 4)     ; ines mir  - Specifies VRAM mirroring of the banks.
        .byte   <NES_MAPPER & $f0                       ; ines map  - Specifies the NES mapper used.
        .byte   0                                       ; Mapper MSB/Submapper
        .byte   0                                       ; PRG-ROM/CHR-ROM size MSB 
        .byte   10                                      ; 64 kB RAM (64 << 10)
        .byte   0,0,0,0,0                               ; Unused settings
