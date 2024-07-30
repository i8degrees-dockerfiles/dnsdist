
# dnsdist

## usage

```shell
dig A time.is @localhost
dig A acme.fs1.home @localhost
```

### setup

First, we must generate a handshake key that is used to 
authenticate to the `dnsdist` console. This is only 
necessary if you wish to connect to the `dnsdist` console.

```shell
echo "SECRET_KEY=$(openssl rand -base64 32)" >> .env.secrets
echo "" >> .env.secrets
```

If you wish to have access to the built-in webserver feature
integrated with `dnsdist`, please generate a passphrase:

```shell
# STUB
```

### dev

```shell
docker compose up -d
docker compose logs
```
