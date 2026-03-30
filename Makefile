pi := /github/pi-mono/packages/coding-agent/dist/cli.js

all:
	echo "ONLY run this in a container"
	cat -n Makefile
	pi --version

export: $(patsubst agent/sessions/%.jsonl,output/%.html,$(shell find agent/sessions -name '*.jsonl'))

output/%.html: agent/sessions/%.jsonl | output
	mkdir -p $(dir $@)
	$(pi) --export $< $@

output:
	mkdir -p output
