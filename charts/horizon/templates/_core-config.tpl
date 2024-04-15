##############################################
# Define default pubnet config

{{- define "core.pubnetConfig" -}}
PUBLIC_HTTP_PORT=true
UNSAFE_QUORUM=true
ENABLE_PULL_MODE=true
INVARIANT_CHECKS=["AccountSubEntriesCountIsValid", "ConservationOfLumens", "ConstantProductInvariant", "LedgerEntryIsValid", "LiabilitiesMatchOffers", "SponsorshipCountIsValid"]
EXPERIMENTAL_BUCKETLIST_DB=true
EXPERIMENTAL_BUCKETLIST_DB_INDEX_PAGE_SIZE_EXPONENT=12
[[HOME_DOMAINS]]
HOME_DOMAIN = "publicnode.org"
QUALITY = "HIGH"
[[HOME_DOMAINS]]
HOME_DOMAIN = "lobstr.co"
QUALITY = "HIGH"
[[HOME_DOMAINS]]
HOME_DOMAIN = "www.franklintempleton.com"
QUALITY = "HIGH"
[[HOME_DOMAINS]]
HOME_DOMAIN = "satoshipay.io"
QUALITY = "HIGH"
[[HOME_DOMAINS]]
HOME_DOMAIN = "whalestack.com"
QUALITY = "HIGH"
[[HOME_DOMAINS]]
HOME_DOMAIN = "www.stellar.org"
QUALITY = "HIGH"
[[HOME_DOMAINS]]
HOME_DOMAIN = "stellar.blockdaemon.com"
QUALITY = "HIGH"
[[VALIDATORS]]
NAME = "Boötes"
PUBLIC_KEY = "GCVJ4Z6TI6Z2SOGENSPXDQ2U4RKH3CNQKYUHNSSPYFPNWTLGS6EBH7I2"
ADDRESS = "bootes.publicnode.org:11625"
HISTORY = "curl -sf https://bootes-history.publicnode.org/{0} -o {1}"
HOME_DOMAIN = "publicnode.org"
[[VALIDATORS]]
NAME = "Lyra by BP Ventures"
PUBLIC_KEY = "GCIXVKNFPKWVMKJKVK2V4NK7D4TC6W3BUMXSIJ365QUAXWBRPPJXIR2Z"
ADDRESS = "lyra.publicnode.org:11625"
HISTORY = "curl -sf https://lyra-history.publicnode.org/{0} -o {1}"
HOME_DOMAIN = "publicnode.org"
[[VALIDATORS]]
NAME = "Hercules by OG Technologies"
PUBLIC_KEY = "GBLJNN3AVZZPG2FYAYTYQKECNWTQYYUUY2KVFN2OUKZKBULXIXBZ4FCT"
ADDRESS = "hercules.publicnode.org:11625"
HISTORY = "curl -sf https://hercules-history.publicnode.org/{0} -o {1}"
HOME_DOMAIN = "publicnode.org"
[[VALIDATORS]]
NAME = "LOBSTR 3 (North America)"
PUBLIC_KEY = "GD5QWEVV4GZZTQP46BRXV5CUMMMLP4JTGFD7FWYJJWRL54CELY6JGQ63"
ADDRESS = "v3.stellar.lobstr.co:11625"
HISTORY = "curl -sf https://archive.v3.stellar.lobstr.co/{0} -o {1}"
HOME_DOMAIN = "lobstr.co"
[[VALIDATORS]]
NAME = "LOBSTR 1 (Europe)"
PUBLIC_KEY = "GCFONE23AB7Y6C5YZOMKUKGETPIAJA4QOYLS5VNS4JHBGKRZCPYHDLW7"
ADDRESS = "v1.stellar.lobstr.co:11625"
HISTORY = "curl -sf https://archive.v1.stellar.lobstr.co/{0} -o {1}"
HOME_DOMAIN = "lobstr.co"
[[VALIDATORS]]
NAME = "LOBSTR 2 (Europe)"
PUBLIC_KEY = "GCB2VSADESRV2DDTIVTFLBDI562K6KE3KMKILBHUHUWFXCUBHGQDI7VL"
ADDRESS = "v2.stellar.lobstr.co:11625"
HISTORY = "curl -sf https://archive.v2.stellar.lobstr.co/{0} -o {1}"
HOME_DOMAIN = "lobstr.co"
[[VALIDATORS]]
NAME = "LOBSTR 4 (Asia)"
PUBLIC_KEY = "GA7TEPCBDQKI7JQLQ34ZURRMK44DVYCIGVXQQWNSWAEQR6KB4FMCBT7J"
ADDRESS = "v4.stellar.lobstr.co:11625"
HISTORY = "curl -sf https://archive.v4.stellar.lobstr.co/{0} -o {1}"
HOME_DOMAIN = "lobstr.co"
[[VALIDATORS]]
NAME = "LOBSTR 5 (India)"
PUBLIC_KEY = "GA5STBMV6QDXFDGD62MEHLLHZTPDI77U3PFOD2SELU5RJDHQWBR5NNK7"
ADDRESS = "v5.stellar.lobstr.co:11625"
HISTORY = "curl -sf https://archive.v5.stellar.lobstr.co/{0} -o {1}"
HOME_DOMAIN = "lobstr.co"
[[VALIDATORS]]
NAME = "FT SCV 2"
PUBLIC_KEY = "GCMSM2VFZGRPTZKPH5OABHGH4F3AVS6XTNJXDGCZ3MKCOSUBH3FL6DOB"
ADDRESS = "stellar2.franklintempleton.com:11625"
HISTORY = "curl -sf https://stellar-history-usc.franklintempleton.com/azuscshf401/{0} -o {1}"
HOME_DOMAIN = "www.franklintempleton.com"
[[VALIDATORS]]
NAME = "FT SCV 3"
PUBLIC_KEY = "GA7DV63PBUUWNUFAF4GAZVXU2OZMYRATDLKTC7VTCG7AU4XUPN5VRX4A"
ADDRESS = "stellar3.franklintempleton.com:11625"
HISTORY = "curl -sf https://stellar-history-ins.franklintempleton.com/azinsshf401/{0} -o {1}"
HOME_DOMAIN = "www.franklintempleton.com"
[[VALIDATORS]]
NAME = "FT SCV 1"
PUBLIC_KEY = "GARYGQ5F2IJEBCZJCBNPWNWVDOFK7IBOHLJKKSG2TMHDQKEEC6P4PE4V"
ADDRESS = "stellar1.franklintempleton.com:11625"
HISTORY = "curl -sf https://stellar-history-usw.franklintempleton.com/azuswshf401/{0} -o {1}"
HOME_DOMAIN = "www.franklintempleton.com"
[[VALIDATORS]]
NAME = "SatoshiPay Frankfurt"
PUBLIC_KEY = "GC5SXLNAM3C4NMGK2PXK4R34B5GNZ47FYQ24ZIBFDFOCU6D4KBN4POAE"
ADDRESS = "stellar-de-fra.satoshipay.io:11625"
HISTORY = "curl -sf https://stellar-history-de-fra.satoshipay.io/{0} -o {1}"
HOME_DOMAIN = "satoshipay.io"
[[VALIDATORS]]
NAME = "SatoshiPay Singapore"
PUBLIC_KEY = "GBJQUIXUO4XSNPAUT6ODLZUJRV2NPXYASKUBY4G5MYP3M47PCVI55MNT"
ADDRESS = "stellar-sg-sin.satoshipay.io:11625"
HISTORY = "curl -sf https://stellar-history-sg-sin.satoshipay.io/{0} -o {1}"
HOME_DOMAIN = "satoshipay.io"
[[VALIDATORS]]
NAME = "SatoshiPay Iowa"
PUBLIC_KEY = "GAK6Z5UVGUVSEK6PEOCAYJISTT5EJBB34PN3NOLEQG2SUKXRVV2F6HZY"
ADDRESS = "stellar-us-iowa.satoshipay.io:11625"
HISTORY = "curl -sf https://stellar-history-us-iowa.satoshipay.io/{0} -o {1}"
HOME_DOMAIN = "satoshipay.io"
[[VALIDATORS]]
NAME = "Whalestack (Germany)"
PUBLIC_KEY = "GD6SZQV3WEJUH352NTVLKEV2JM2RH266VPEM7EH5QLLI7ZZAALMLNUVN"
ADDRESS = "germany.stellar.whalestack.com:11625"
HISTORY = "curl -sf https://germany.stellar.whalestack.com/history/{0} -o {1}"
HOME_DOMAIN = "whalestack.com"
[[VALIDATORS]]
NAME = "Whalestack (Hong Kong)"
PUBLIC_KEY = "GAZ437J46SCFPZEDLVGDMKZPLFO77XJ4QVAURSJVRZK2T5S7XUFHXI2Z"
ADDRESS = "hongkong.stellar.whalestack.com:11625"
HISTORY = "curl -sf https://hongkong.stellar.whalestack.com/history/{0} -o {1}"
HOME_DOMAIN = "whalestack.com"
[[VALIDATORS]]
NAME = "Whalestack (Finland)"
PUBLIC_KEY = "GADLA6BJK6VK33EM2IDQM37L5KGVCY5MSHSHVJA4SCNGNUIEOTCR6J5T"
ADDRESS = "finland.stellar.whalestack.com:11625"
HISTORY = "curl -sf https://finland.stellar.whalestack.com/history/{0} -o {1}"
HOME_DOMAIN = "whalestack.com"
[[VALIDATORS]]
NAME = "SDF 2"
PUBLIC_KEY = "GCM6QMP3DLRPTAZW2UZPCPX2LF3SXWXKPMP3GKFZBDSF3QZGV2G5QSTK"
ADDRESS = "core-live-b.stellar.org:11625"
HISTORY = "curl -sf http://history.stellar.org/prd/core-live/core_live_002/{0} -o {1}"
HOME_DOMAIN = "www.stellar.org"
[[VALIDATORS]]
NAME = "SDF 1"
PUBLIC_KEY = "GCGB2S2KGYARPVIA37HYZXVRM2YZUEXA6S33ZU5BUDC6THSB62LZSTYH"
ADDRESS = "core-live-a.stellar.org:11625"
HISTORY = "curl -sf http://history.stellar.org/prd/core-live/core_live_001/{0} -o {1}"
HOME_DOMAIN = "www.stellar.org"
[[VALIDATORS]]
NAME = "SDF 3"
PUBLIC_KEY = "GABMKJM6I25XI4K7U6XWMULOUQIQ27BCTMLS6BYYSOWKTBUXVRJSXHYQ"
ADDRESS = "core-live-c.stellar.org:11625"
HISTORY = "curl -sf http://history.stellar.org/prd/core-live/core_live_003/{0} -o {1}"
HOME_DOMAIN = "www.stellar.org"
[[VALIDATORS]]
NAME = "Blockdaemon Validator 3"
PUBLIC_KEY = "GAYXZ4PZ7P6QOX7EBHPIZXNWY4KCOBYWJCA4WKWRKC7XIUS3UJPT6EZ4"
ADDRESS = "stellar-full-validator3.bdnodes.net:11625"
HISTORY = "curl -sf https://stellar-full-history3.bdnodes.net/{0} -o {1}"
HOME_DOMAIN = "stellar.blockdaemon.com"
[[VALIDATORS]]
NAME = "Blockdaemon Validator 2"
PUBLIC_KEY = "GAVXB7SBJRYHSG6KSQHY74N7JAFRL4PFVZCNWW2ARI6ZEKNBJSMSKW7C"
ADDRESS = "stellar-full-validator2.bdnodes.net:11625"
HISTORY = "curl -sf https://stellar-full-history2.bdnodes.net/{0} -o {1}"
HOME_DOMAIN = "stellar.blockdaemon.com"
[[VALIDATORS]]
NAME = "Blockdaemon Validator 1"
PUBLIC_KEY = "GAAV2GCVFLNN522ORUYFV33E76VPC22E72S75AQ6MBR5V45Z5DWVPWEU"
ADDRESS = "stellar-full-validator1.bdnodes.net:11625"
HISTORY = "curl -sf https://stellar-full-history1.bdnodes.net/{0} -o {1}"
HOME_DOMAIN = "stellar.blockdaemon.com"
{{- end }}

##############################################
# Define default testnet config
{{- define "core.testnetConfig" -}}
PUBLIC_HTTP_PORT=true
ENABLE_PULL_MODE=true
INVARIANT_CHECKS=["AccountSubEntriesCountIsValid", "ConservationOfLumens", "ConstantProductInvariant", "LedgerEntryIsValid", "LiabilitiesMatchOffers", "SponsorshipCountIsValid"]
EXPERIMENTAL_BUCKETLIST_DB=true
EXPERIMENTAL_BUCKETLIST_DB_INDEX_PAGE_SIZE_EXPONENT=12
[[HOME_DOMAINS]]
HOME_DOMAIN="testnet.stellar.org"
QUALITY="HIGH"
[[VALIDATORS]]
ADDRESS="core-testnet1.stellar.org"
HISTORY="curl -sf http://history.stellar.org/prd/core-testnet/core_testnet_001/{0} -o {1}"
HOME_DOMAIN="testnet.stellar.org"
NAME="sdf_testnet_1"
PUBLIC_KEY="GDKXE2OZMJIPOSLNA6N6F2BVCI3O777I2OOC4BV7VOYUEHYX7RTRYA7Y"
[[VALIDATORS]]
ADDRESS="core-testnet2.stellar.org"
HISTORY="curl -sf http://history.stellar.org/prd/core-testnet/core_testnet_002/{0} -o {1}"
HOME_DOMAIN="testnet.stellar.org"
NAME="sdf_testnet_2"
PUBLIC_KEY="GCUCJTIYXSOXKBSNFGNFWW5MUQ54HKRPGJUTQFJ5RQXZXNOLNXYDHRAP"
[[VALIDATORS]]
ADDRESS="core-testnet3.stellar.org"
HISTORY="curl -sf http://history.stellar.org/prd/core-testnet/core_testnet_003/{0} -o {1}"
HOME_DOMAIN="testnet.stellar.org"
NAME="sdf_testnet_3"
PUBLIC_KEY="GC2V2EFSXN6SQTWVYA5EPJPBWWIMSD2XQNKUOHGEKB535AQE2I6IXV2Z"
{{- end }}
