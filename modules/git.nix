{ config, pkgs, ... }: {
	programs.git = {
		enable = true;
		config = {
			user = {
			email = "243776410+Azteczek@users.noreply.github.com";
			name = "Azteczek";
			};
		};
	}; 
}
