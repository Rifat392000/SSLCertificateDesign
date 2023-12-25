;
; BIND data file for local loopback interface
;
$TTL	604800
@	IN	SOA	ns1.ewubdserver.com. root.ewubdserver.com. (
			      2		; Serial
			 604800		; Refresh
			  86400		; Retry
			2419200		; Expire
			 604800 )	; Negative Cache TTL
;
@	IN	NS	ns1.ewubdserver.com.
ns1	IN	A	192.168.56.5
www	IN	A	192.168.56.5
ftp	IN	A	192.168.56.5
@       IN      MX      10	mail
mail    IN      A       192.168.56.5
@	IN	AAAA	::1
