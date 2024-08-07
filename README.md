
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
echo "DNSDIST_API_KEY=$(openssl rand -base64 32)" >> .env.secrets
echo "" >> .env.secrets
```

Upon the next startup, `dnsdist` will automatically create 
`/etc/dnsdist/conf.d/_api.conf` for us once we have 
initialized `DNSDIST_API_KEY`. It uses this variable to
setup both the integrated webserver -- port `8083` -- and 
the administrative console that is available at port `5199`.

If you wish to have access to the built-in webserver feature
integrated with `dnsdist`, please generate a passphrase:

```shell
# STUB
```

#### webserver api

[dnsdist: webserver](https://dnsdist.org/guides/webserver.html)

```shell
cd "~/dnsdist.git"
source .env.secrets;
curl -Lv -H "X-API-Key: $DNSDIST_API_KEY" http://localhost:8083/jsonstat?command=stats | jq .
```

### dev

```shell
docker compose up -d
docker compose logs
```

## TODO

- [ ] setup blacklist database with CDB tools; I would like to see 
our entire *RPZ* sourcing lists at **ns3.home** and **ns4.home** to
be available as a CDB file that we can use here.
  * [blocklist-domains](https://github.com/dmachard/blocklist-domains)
  * <https://github.com/dmachard/python-blocklist-aggregator/blob/main/blocklist_aggregator/blocklist.conf>
- [ ] Finalize IPv6 deployment; this includes re-adding `AAAA` entry for `docker.fs1.home` as `dnsdist`
was trying to default to using this address first in name resolution
  * `docker.fs1.home 60      IN      AAAA    fd5e:5615:65f4:cce1:be24:11ff:fe13:62cc`

