# Time Zone Module

Overrides the current time zone settings for your vm by creating a symlink over the top of the current timezone setting. Tested against precise64 box.

# Example usage

As an include with default time zone (CST6CDT)
     include timezone

As a class with default time zone (CST6CDT)
     class { "timezone":}
	 
As a class where you override the default timezone with your own value.
	 class { "timezone":
		zone => "CST6CDT",
	 }
	 
