OUT_DIRS=obj rom

$(info $(shell mkdir -p $(OUT_DIRS)))

obj/%.o: src/%.s
	ca65 $< -o $@

rom/nes64.nes: obj/nes_header.o obj/basic_and_kernal.o obj/c64_uppercase.o obj/c64_lowercase.o
	ld65 $^ --config src/mmc5.cfg -o $@

all: rom/nes64.nes

clean:
	rm -rf obj/*.o rom/*.nes

