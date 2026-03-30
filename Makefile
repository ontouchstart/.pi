all:
	echo "ONLY run this in a container"
	cat -n Makefile

build:
	npm install --save-dev @mariozechner/pi-coding-agent@latest
	npx pi --version

export: $(patsubst agent/sessions/%.jsonl,output/%.html,$(shell find agent/sessions -name '*.jsonl'))

output/%.html: agent/sessions/%.jsonl | output
	mkdir -p $(dir $@)
	npx pi --export $< $@

output:
	mkdir -p output
