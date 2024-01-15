
```bash
zone "ewubdserver.com" IN {
	type master;
	file "/etc/bind/db.ewubdserver.com";
};
zone "56.168.192.in-addr.arpa" IN {
	type master;
	file "/etc/bind/db.56.168.192";
};

```

>named.conf.options
```bash
options {
	directory "/var/cache/bind";

	// If there is a firewall between you and nameservers you want
	// to talk to, you may need to fix the firewall to allow multiple
	// ports to talk.  See http://www.kb.cert.org/vuls/id/800113

	// If your ISP provided one or more IP addresses for stable 
	// nameservers, you probably want to use them as forwarders.  
	// Uncomment the following block, and insert the addresses replacing 
	// the all-0's placeholder.

	// forwarders {
	// 	0.0.0.0;
	// };

	//========================================================================
	// If BIND logs error messages about the root key being expired,
	// you will need to update your keys.  See https://www.isc.org/bind-keys
	//========================================================================
	dnssec-validation auto;

	listen-on-v6 { any; };
	recursion yes;
	listen-on{192.168.56.5;};
	allow-transfer {none;};
	
	forwarders {
		192.168.56.0;
	 };
	
};
```

>db.ewubdserver.com
```bash
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
```

>db.56.168.192
```bash
;
; BIND reverse data file for local loopback interface
;
$TTL	604800
@	IN	SOA	ns1.ewubdserver.com. root.ewubdserver.com. (
			      1		; Serial
			 604800		; Refresh
			  86400		; Retry
			2419200		; Expire
			 604800 )	; Negative Cache TTL
;
@	IN	NS	ns1.ewubdserver.com.
24	IN	PTR	ns1.ewubdserver.com.
24	IN	PTR	www.ewubdserver.com.
24	IN	PTR	ftp.ewubdserver.com.
24	IN	PTR	mail.ewubdserver.com.
```
