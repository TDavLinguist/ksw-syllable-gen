all: ksw-syllables.ksw.lexd.att ksw-syllables.ksw.hfst ksw-syllables.ksw.txt ksw-syllables-CC0.txt

ksw-syllables.ksw.lexd.att: ksw-syllables.ksw.lexd
	lexd ksw-syllables.ksw.lexd > $@

ksw-syllables.ksw.hfst: ksw-syllables.ksw.lexd.att
	hfst-txt2fst ksw-syllables.ksw.lexd.att -o $@

ksw-syllables.ksw.txt: ksw-syllables.ksw.hfst
	hfst-fst2strings ksw-syllables.ksw.hfst | cut -d ":" -f 2 > $@
	
ksw-syllables-CC0.txt: ksw-syllables-cc0-HEAD ksw-syllables.ksw.txt
	cat $^ > $@

unrestricted: ksw-syllables.ksw.unrestricted.lexd.att ksw-syllables.ksw.unrestricted.hfst ksw-syllables.ksw.unrestricted.txt

ksw-syllables.ksw.unrestricted.lexd.att: ksw-syllables.ksw.unrestricted.lexd
	lexd ksw-syllables.ksw.unrestricted.lexd > $@

ksw-syllables.ksw.unrestricted.hfst: ksw-syllables.ksw.unrestricted.lexd.att
	hfst-txt2fst ksw-syllables.ksw.unrestricted.lexd.att -o $@

ksw-syllables.ksw.unrestricted.txt: ksw-syllables.ksw.unrestricted.hfst
	hfst-fst2strings ksw-syllables.ksw.unrestricted.hfst | cut -d ":" -f 2 > $@

clean: ksw-syllables.ksw.lexd.att ksw-syllables.ksw.hfst ksw-syllables.ksw.txt ksw-syllables.ksw.unrestricted.lexd.att ksw-syllables.ksw.unrestricted.hfst ksw-syllables.ksw.unrestricted.txt
	rm $^
