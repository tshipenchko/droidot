switch:
	nix-on-droid switch --flake .

clean:
	nix-collect-garbage -d
