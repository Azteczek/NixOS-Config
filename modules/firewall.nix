{ config, pkgs, ... }: {
	networking.firewall.allowedTCPPorts = [8080 8000 3979 25565];
	networking.firewall.allowedUDPPorts = [
		3979 # OpenTTD.
	];
	networking.firewall.checkReversePath = "loose";
	networking.firewall.trustedInterfaces = [ "ztktix6bjp" ]; 
}
