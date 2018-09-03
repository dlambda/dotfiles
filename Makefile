SHELL	= /bin/sh
LANG	= C

XDG_CONFIG := .config
CANDIDATES	:= $(wildcard .??* $(XDG_CONFIG)/* bin/*) 
EXCLUDE := .git .gitignore $(XDG_CONFIG)
DOTFILES := $(filter-out $(EXCLUDE), $(CANDIDATES))

all:

list:
	@$(foreach f,$(DOTFILES),/bin/ls -d $(f);)

link:
	@echo "These dotfiles are linked."
	@rm -rf $(HOME)/$(XDG_CONFIG)/fish
	@mkdir -p $(HOME)/bin
	@$(foreach f,$(DOTFILES), ln -sfnv $(abspath $(f)) $(HOME)/$(f);)

clean:
	$(foreach f,$(DOTFILES),/bin/rm -f $(HOME)/$(f);)
