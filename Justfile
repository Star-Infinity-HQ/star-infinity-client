alias b := build
alias c := clean
alias rb := rebuild
alias t := test
alias l := lint
alias f := format
alias ch := check

_default:
	@just --list --unsorted

# NOTE: Builds the root directory (type=dev | start)
build type="dev":
	@echo "{{BG_BLUE}}INFO:{{NORMAL}} Performing build operation on root directory."
	@npm install
	@npm run {{type}}

# NOTE: Cleans up all node_modules, dist, {pnpm,package}-lock.json files (currently)
clean:
	@echo "{{BG_BLUE}}INFO:{{NORMAL}} Performing clean operation on root directory."
	@find . -name "node_modules" -type d -prune -print -exec rm -rf "{}" \;
	@find . -name "pnpm-lock.yaml" -type f -prune -print -exec rm -rf "{}" \;
	@find . -name "package-lock.json" -type f -prune -print -exec rm -rf "{}" \;
	@find . -name "yarn.lock" -type f -prune -print -exec rm -rf "{}" \;

# NOTE: Cleans and rebuilds entire root directory
rebuild:
	@just clean
	@just build

# NOTE: Using biome.json, perform lint operation on all files in '.'
lint:
	@echo "{{BG_BLUE}}INFO:{{NORMAL}} Performing linting operation on root directory."
	@npx @biomjs/biome lint --write .

# NOTE: Using biome.json, perform format operation on all files in '.'
format:
	@echo "{{BG_BLUE}}INFO:{{NORMAL}} Performing formatting operation on root directory."
	@npx @biomjs/biome format --write .

# NOTE: Using biome.json, perform check (lint + format) operation on all files in '.'
check:
	@echo "{{BG_BLUE}}INFO:{{NORMAL}} Performing checking operation on root directory."
	@npx @biomjs/biome check --write .

# NOTE: Using playwright, biome.json, perform 3 step lint - format - test operation on all files in '.'
test:
	@echo "{{BG_BLUE}}INFO:{{NORMAL}} Performing (lint, format, test) operation on root directory."
	@just lint
	@just format
	@echo "{{BG_BLUE}}INFO:{{NORMAL}} Running all defined playwright tests."
	@npm run test
