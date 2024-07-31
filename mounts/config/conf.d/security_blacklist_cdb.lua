-- dnsdist configuration snippet
--
-- 1. https://github.com/dmachard/lua-dnsdist-config-examples/blob/main/security_blacklist_cdb.lua
-- 

--- open your CDB database, example available here https://github.com/dmachard/blocklist-domains
--- dnsdist with reload this database every 3600s
kvs = newCDBKVStore("/etc/dnsdist/blocklist.cdb", 3600)

-- block domains ?
addAction(KeyValueStoreLookupRule(kvs, KeyValueLookupKeyQName(false)), SetTagAction('policy_block'))
addAction(TagRule('policy_block'), SpoofAction({"127.0.0.1", "::1"}))

--- or answer with NXDOMAIN
--- addAction(TagRule('policy_block'), RCodeAction(DNSRCode.NXDOMAIN))

-- default rule
addAction( AllRule(), PoolAction("default"))

