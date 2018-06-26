# redirect.docker

catch all http redirector, useful for http -> https redirects

Insanely fast and small! Based on alpine and nginx.

## Launching

```bash
docker run -d -e REDIRECT="https://www.google.com/" -p 8080:80 cusspvz/redirect
```

Now you should be able to browse to `http://localhost:8080/any/path` and
have your browser redirected to `https://www.google.com/any/path`.

## Environment variables

Adjust Dockerfile to override the defaults


### HSTS
Defaults to: 0

Toggles Https Strict Transport Security when it is NON ZERO


### HSTS_INCLUDE_SUBDOMAINS
Defaults to: 0

In case HSTS is on, this toggles the subdomains when it is NON ZERO


### WORKER_CONNECTIONS
Defaults to: 1024


### HTTP_PORT
Defaults to: 80


### REDIRECT
Defaults to: https://$host
