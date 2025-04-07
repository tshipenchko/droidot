switch:
	nix-on-droid switch --flake .

clean:
	nix-collect-garbage -d

update:
	nix flake update --commit-lock-file

reformat:
	nixpkgs-fmt .

index:
	@mkdir -p ~/.cache/nix-index && cd ~/.cache/nix-index && \
	filename="index-$$(uname -m | sed 's/^arm64$$/aarch64/')-$$(uname | tr A-Z a-z)" && \
	wget -q -N https://github.com/nix-community/nix-index-database/releases/latest/download/$$filename && \
	ln -f $$filename files

