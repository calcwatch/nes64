.segment "CHARS"

.scope NormalCharacters
  XOR_MASK = $00
  .include "c64_uppercase.inc"
.endscope

.scope ReversedCharacters
  XOR_MASK = $FF
  .include "c64_uppercase.inc"
.endscope
