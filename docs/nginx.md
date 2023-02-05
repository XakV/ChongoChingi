# nginx from linuxserver.io 
'''
/etc/nginx/
\_root@a8428ed91fa9:/# ls -l /etc/nginx/
   total 44
   -rw-r--r-- 1 root root 1077 Apr 28  2022 fastcgi.conf
   -rw-r--r-- 1 root root 1530 Nov 29 14:46 fastcgi_params
   drwxr-xr-x 2 root root 4096 Nov 29 14:46 http.d
   -rw-r--r-- 1 root root 5231 Apr 28  2022 mime.types
   drwxr-xr-x 1 root root 4096 Dec  2 13:34 modules
   -rw-rw-r-- 1 root root   34 Nov 29 14:45 nginx.conf
   -rw-r--r-- 1 root root  636 Apr 28  2022 scgi_params
   -rw-r--r-- 1 root root  389 Apr 28  2022 stream.conf
   drwxr-xr-x 2 root root 4096 Dec  2 13:34 stream.d
   -rw-r--r-- 1 root root  664 Apr 28  2022 uwsgi_params
'''

## Chat GPT instructions
To configure nginx as a reverse proxy with an SSL certificate, you will need to complete the following steps:

    Obtain an SSL certificate: You will need to obtain an SSL certificate for your domain. You can purchase a certificate from a trusted certificate authority (CA) or generate a self-signed certificate.

    Install nginx: If you don't already have nginx installed on your server, you will need to install it. This can typically be done using your operating system's package manager.

    Configure nginx: Once you have nginx installed, you will need to edit the nginx configuration file to set up the reverse proxy. This file is typically located at /etc/nginx/nginx.conf.

    Set up the SSL certificate: In the nginx configuration file, you will need to specify the location of your SSL certificate and the corresponding private key. You can do this using the ssl_certificate and ssl_certificate_key directives.

    Configure the reverse proxy: In the nginx configuration file, you will need to set up a server block for the reverse proxy. This will involve specifying the proxy_pass directive, which tells nginx where to forward incoming requests. You will also need to specify any additional proxy settings that are needed, such as proxy_redirect or proxy_set_header.

    Test your configuration: After you have completed the above steps, you can test your nginx configuration by running the nginx -t command. If there are no errors, you can then reload nginx to apply the changes.

Here is an example configuration that demonstrates how to set up nginx as a reverse proxy with an SSL certificate:

```
# specify the locations of the SSL certificate and private key
ssl_certificate /path/to/ssl_certificate.pem;
ssl_certificate_key /path/to/ssl_key.pem;

# set up a server block for the reverse proxy
server {
    listen 443 ssl;
    server_name example.com;

    # specify the location of the upstream server
    location / {
        proxy_pass http://upstream_server;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
    }
}
```

To use a single SSL certificate to secure multiple subdomains with nginx's server_name directive, you will need to complete the following steps:

    Obtain an SSL certificate: You will need to obtain an SSL certificate that covers all of the subdomains that you want to secure. You can either purchase a certificate from a trusted certificate authority (CA) or generate a self-signed certificate.

    Install nginx: If you don't already have nginx installed on your server, you will need to install it. This can typically be done using your operating system's package manager.

    Configure nginx: Once you have nginx installed, you will need to edit the nginx configuration file to set up the reverse proxy. This file is typically located at /etc/nginx/nginx.conf.

    Set up the SSL certificate: In the nginx configuration file, you will need to specify the location of your SSL certificate and the corresponding private key. You can do this using the ssl_certificate and ssl_certificate_key directives.

    Configure the reverse proxy: In the nginx configuration file, you will need to set up a server block for the reverse proxy. This will involve specifying the proxy_pass directive, which tells nginx where to forward incoming requests. You will also need to specify any additional proxy settings that are needed, such as proxy_redirect or proxy_set_header.

    Specify the server_name directive: In the server block for the reverse proxy, you will need to use the server_name directive to specify the subdomains that you want to secure with the SSL certificate. For example, if you want to secure the subdomains test.example.com and dev.example.com, you would use the following server_name directive:

```
server_name test.example.com dev.example.com;
```

    Test your configuration: After you have completed the above steps, you can test your nginx configuration by running the nginx -t command. If there are no errors, you can then reload nginx to apply the changes.

Here is an example configuration that demonstrates how to use a single SSL certificate to secure multiple subdomains with nginx's server_name directive:

```
# specify the locations of the SSL certificate and private key
ssl_certificate /path/to/ssl_certificate.pem;
ssl_certificate_key /path/to/ssl_key.pem;

# set up a server block for the reverse proxy
server {
    listen 443 ssl;

    # specify the subdomains to secure with the SSL certificate
    server_name test.example.com dev.example.com;

    # specify the location of the upstream server
    location / {
        proxy_pass http://upstream_server;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
    }
}
```
