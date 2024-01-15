>Install OpenSSL, Gedit and Tree
```
sudo apt install openssl 
```
```
sudo apt install gedit 
```
```
sudo apt install tree
```
>Setting up the directory structure

```
mkdir -p ca/{root-ca,sub-ca,server}/{private,certs,index,serial,pem,crl,csr}
```
```
cd ca
```
>Secure private key directories with read/write/execute permissions for owner only
```
chmod -v 700 {root-ca,sub-ca,server}/private
```
>Create empty files to track certificate issuance and serial numbers

```
touch root-ca/index/index
```

```
touch sub-ca/index/index
```
>Generate random numbers for unique certificate serial numbers

```
openssl rand -hex 16 > root-ca/serial/serial
```

```
openssl rand -hex 16 > sub-ca/serial/serial
```

> [!IMPORTANT]
>root-ca.conf 

```
gedit root-ca/root-ca.conf
```

```
#root-ca.conf
[ca]

default_ca    = CA_default

 

[CA_default]

dir     = root-ca

certs     =  $dir/certs

crl_dir    = $dir/crl

new_certs_dir   = $dir/pem

database   = $dir/index/index

serial    = $dir/serial/serial

RANDFILE   = $dir/private/.rand

 

private_key   = $dir/private/ca.key

certificate   = $dir/certs/ca.crt

 

crlnumber   = $dir/crlnumber

crl    =  $dir/crl/ca.crl

crl_extensions   = crl_ext

default_crl_days    = 30

 

default_md   = sha256

 

name_opt   = ca_default

cert_opt   = ca_default

default_days   = 365

preserve   = no

policy    = policy_strict

 

[ policy_strict ]

countryName   = supplied

stateOrProvinceName  =  supplied

organizationName  = match

organizationalUnitName  =  optional

commonName   =  supplied

emailAddress   =  optional

 

[ policy_loose ]

countryName   = optional

stateOrProvinceName  = optional

localityName   = optional

organizationName  = optional

organizationalUnitName   = optional

commonName   = supplied

emailAddress   = optional

 

[ req ]

# Options for the req tool, man req.

default_bits   = 2048

distinguished_name  = req_distinguished_name

string_mask   = utf8only

default_md   =  sha256

# Extension to add when the -x509 option is used.

x509_extensions   = v3_ca

 

[ req_distinguished_name ]


countryName                     = Country Name (2 letter code)

stateOrProvinceName             = State or Province Name

localityName                    = Locality Name

0.organizationName              = Organization Name

organizationalUnitName          = Organizational Unit Name

commonName                      = Common Name

emailAddress                    = Email Address

countryName_default  = BD

stateOrProvinceName_default = DHK

localityName_default = RAMPURA

0.organizationName_default = EWUBD

organizationalUnitName_default = ADMIN

commonName_default = rootCA

 

[ v3_ca ]

# Extensions to apply when createing root ca

# Extensions for a typical CA, man x509v3_config

subjectKeyIdentifier  = hash

authorityKeyIdentifier  = keyid:always,issuer

basicConstraints  = critical, CA:true

keyUsage   =  critical, digitalSignature, cRLSign, keyCertSign

 

[ v3_intermediate_ca ]

# Extensions to apply when creating intermediate or sub-ca

# Extensions for a typical intermediate CA, same man as above

subjectKeyIdentifier  = hash

authorityKeyIdentifier  = keyid:always,issuer

#pathlen:0 ensures no more sub-ca can be created below an intermediate

basicConstraints  = critical, CA:true, pathlen:0

keyUsage   = critical, digitalSignature, cRLSign, keyCertSign

 

[ server_cert ]

# Extensions for server certificates

basicConstraints  = CA:FALSE

nsCertType   = server

nsComment   =  "OpenSSL Generated Server Certificate"

subjectKeyIdentifier  = hash

authorityKeyIdentifier  = keyid,issuer:always

keyUsage   =  critical, digitalSignature, keyEncipherment

extendedKeyUsage  = serverAuth

```

> [!IMPORTANT]
>sub-ca.conf 

```
gedit sub-ca/sub-ca.conf
```

```
#sub-ca.conf

[ca]
default_ca    = CA_default

 

[CA_default]

dir     = sub-ca

certs     =  $dir/certs

crl_dir    = $dir/crl

new_certs_dir   = $dir/pem

database   = $dir/index/index

serial    = $dir/serial/serial

RANDFILE   = $dir/private/.rand

 

private_key   = $dir/private/sub-ca.key

certificate   = $dir/certs/sub-ca.crt

 

crlnumber   = $dir/crlnumber

crl    =  $dir/crl/ca.crl

crl_extensions   = crl_ext

default_crl_days    = 30

 

default_md   = sha256

 

name_opt   = ca_default

cert_opt   = ca_default

default_days   = 365

preserve   = no

policy    = policy_loose

 

[ policy_strict ]

countryName   = supplied

stateOrProvinceName  =  supplied

organizationName  = match

organizationalUnitName  =  optional

commonName   =  supplied

emailAddress   =  optional

 

[ policy_loose ]

countryName   = optional

stateOrProvinceName  = optional

localityName   = optional

organizationName  = optional

organizationalUnitName   = optional

commonName   = supplied

emailAddress   = optional

 

[ req ]

# Options for the req tool, man req.

default_bits   = 2048

distinguished_name  = req_distinguished_name

string_mask   = utf8only

default_md   =  sha256

# Extension to add when the -x509 option is used.

x509_extensions   = v3_ca

 

[ req_distinguished_name ]

countryName                     = Country Name (2 letter code)

stateOrProvinceName             = State or Province Name

localityName                    = Locality Name

0.organizationName              = Organization Name

organizationalUnitName          = Organizational Unit Name

commonName                      = Common Name

emailAddress                    = Email Address

countryName_default  = BD

stateOrProvinceName_default = DHK

localityName_default = RAMPURA

0.organizationName_default = EWUBD

organizationalUnitName_default = SUBADMIN

commonName_default = subCA

 

[ v3_ca ]

# Extensions to apply when createing root ca

# Extensions for a typical CA, man x509v3_config

subjectKeyIdentifier  = hash

authorityKeyIdentifier  = keyid:always,issuer

basicConstraints  = critical, CA:true

keyUsage   =  critical, digitalSignature, cRLSign, keyCertSign

 

[ v3_intermediate_ca ]

# Extensions to apply when creating intermediate or sub-ca

# Extensions for a typical intermediate CA, same man as above

subjectKeyIdentifier  = hash

authorityKeyIdentifier  = keyid:always,issuer

#pathlen:0 ensures no more sub-ca can be created below an intermediate

basicConstraints  = critical, CA:true, pathlen:0

keyUsage   = critical, digitalSignature, cRLSign, keyCertSign

 

[ server_cert ]
# Extensions for server certificates
basicConstraints  = CA:FALSE
nsCertType   = server
nsComment   =  "OpenSSL Generated Server Certificate"
subjectKeyIdentifier  = hash
authorityKeyIdentifier  = keyid,issuer:always
keyUsage   =  critical, digitalSignature, keyEncipherment
extendedKeyUsage  = serverAuth
[ server_cert ]
# Extensions for server certificates
basicConstraints  = CA:FALSE
nsCertType   = server
nsComment   =  "OpenSSL Generated Server Certificate"
subjectKeyIdentifier  = hash
authorityKeyIdentifier  = keyid,issuer:always
keyUsage   =  critical, digitalSignature, keyEncipherment
extendedKeyUsage  = serverAuth
subjectAltName = @alt_names

[alt_names]
DNS.1 = ewubdserver.com
DNS.2 = *.ewubdserver.com
DNS.3 = www.ewubdserver.com

```
>Generate a strong encryption key (4096 bits) for the Root CA

```
openssl genrsa -aes256 -out root-ca/private/ca.key 4096
```
>Generate a strong encryption key (4096 bits) for the Sub CA

```
openssl genrsa -aes256 -out sub-ca/private/sub-ca.key 4096
```
>Generate a strong encryption key (2048 bits) for the server

```
openssl genrsa -out server/private/server.key 2048
```
>Create a self-signed Root CA certificate valid for 20 years (7305 days)

```
openssl req -config root-ca/root-ca.conf -key root-ca/private/ca.key -new -x509 -days 7305 -sha256 -extensions v3_ca -out root-ca/certs/ca.crt
```
>Create a certificate signing request (CSR) for the Sub CA

```
openssl req -config sub-ca/sub-ca.conf -new -key sub-ca/private/sub-ca.key -sha256 -out sub-ca/csr/sub-ca.csr
```
>Sign the Sub CA CSR using the Root CA, creating a valid Sub CA certificate for one year (365 days)

```
openssl ca -config root-ca/root-ca.conf -extensions v3_intermediate_ca -days 365 -notext -in sub-ca/csr/sub-ca.csr -out sub-ca/certs/sub-ca.crt
```
>Create a CSR for the server

```
openssl req -key server/private/server.key -new -sha256 -out server/csr/server.csr
```
>Sign the server CSR using the Sub CA, creating a server certificate valid for one year (365 days)

```
openssl ca -config sub-ca/sub-ca.conf -extensions server_cert -days 365 -notext -in server/csr/server.csr -out server/certs/server.crt
```
>Create a PKCS#12 (PFX) bundle containing the server's certificate and private key for easy deployment

```
openssl pkcs12 -inkey server/private/server.key -in server/certs/server.crt -export -out server/certs/server.pfx
```

```
tree
```

```
mkdir generated
```
>Organizing generated files

```
cp root-ca/certs/ca.crt generated
cp sub-ca/certs/sub-ca.crt generated
cp server/certs/server.crt generated
```

```
cp server/private/server.key generated
```

```
cp server/certs/server.pfx generated
```
> Move to the "generated" directory and combine the server, Sub CA, and Root CA certificates into a single file for easier installation


```
cd generated
```

```
cat server.crt sub-ca.crt ca.crt > chained.crt
```
```
sudo chmod 700 server.key server.pfx
```

```
tree
```