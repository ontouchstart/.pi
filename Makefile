pi := /pi-mono/packages/coding-agent/dist/cli.js

all:
	echo "ONLY run this in a container"
	echo "This will fail outside of a container"
	$(pi) --version

export: $(patsubst agent/sessions/%.jsonl,agent/sessions/%.html,$(shell find agent/sessions -name '*.jsonl'))

agent/sessions/%.html: agent/sessions/%.jsonl 
	$(pi) --export $< $@

