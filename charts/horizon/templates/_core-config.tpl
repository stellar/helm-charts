##############################################
# Define default pubnet config

{{- define "core.pubnetConfig" -}}
PUBLIC_HTTP_PORT=true
HTTP_PORT=11626
UNSAFE_QUORUM=true
ENABLE_PULL_MODE=true
INVARIANT_CHECKS=["AccountSubEntriesCountIsValid", "ConservationOfLumens", "ConstantProductInvariant", "LedgerEntryIsValid", "LiabilitiesMatchOffers", "SponsorshipCountIsValid"]
EXPERIMENTAL_BUCKETLIST_DB=true
EXPERIMENTAL_BUCKETLIST_DB_INDEX_PAGE_SIZE_EXPONENT=12
[[HOME_DOMAINS]]
HOME_DOMAIN="www.stellar.org"
QUALITY="HIGH"
[[HOME_DOMAINS]]
HOME_DOMAIN="stellar.blockdaemon.com"
QUALITY="HIGH"
[[HOME_DOMAINS]]
HOME_DOMAIN="coinqvest.com"
QUALITY="HIGH"
[[HOME_DOMAINS]]
HOME_DOMAIN="satoshipay.io"
QUALITY="HIGH"
[[HOME_DOMAINS]]
HOME_DOMAIN="publicnode.org"
QUALITY="HIGH"
[[HOME_DOMAINS]]
HOME_DOMAIN="lobstr.co"
QUALITY="HIGH"
[[VALIDATORS]]
ADDRESS="core-live-a.stellar.org"
HISTORY="curl -sf http://history.stellar.org/prd/core-live/core_live_001/{0} -o {1}"
HOME_DOMAIN="www.stellar.org"
NAME="sdf_live_1"
PUBLIC_KEY="GCGB2S2KGYARPVIA37HYZXVRM2YZUEXA6S33ZU5BUDC6THSB62LZSTYH"
[[VALIDATORS]]
ADDRESS="core-live-b.stellar.org"
HISTORY="curl -sf http://history.stellar.org/prd/core-live/core_live_002/{0} -o {1}"
HOME_DOMAIN="www.stellar.org"
NAME="sdf_live_2"
PUBLIC_KEY="GCM6QMP3DLRPTAZW2UZPCPX2LF3SXWXKPMP3GKFZBDSF3QZGV2G5QSTK"
[[VALIDATORS]]
ADDRESS="core-live-c.stellar.org"
HISTORY="curl -sf http://history.stellar.org/prd/core-live/core_live_003/{0} -o {1}"
HOME_DOMAIN="www.stellar.org"
NAME="sdf_live_3"
PUBLIC_KEY="GABMKJM6I25XI4K7U6XWMULOUQIQ27BCTMLS6BYYSOWKTBUXVRJSXHYQ"
[[VALIDATORS]]
ADDRESS="stellar-full-validator1.bdnodes.net"
HISTORY="curl -sf https://stellar-full-history1.bdnodes.net/{0} -o {1}"
HOME_DOMAIN="stellar.blockdaemon.com"
NAME="blockdaemon_1"
PUBLIC_KEY="GAAV2GCVFLNN522ORUYFV33E76VPC22E72S75AQ6MBR5V45Z5DWVPWEU"
[[VALIDATORS]]
ADDRESS="stellar-full-validator2.bdnodes.net"
HISTORY="curl -sf https://stellar-full-history2.bdnodes.net/{0} -o {1}"
HOME_DOMAIN="stellar.blockdaemon.com"
NAME="blockdaemon_2"
PUBLIC_KEY="GAVXB7SBJRYHSG6KSQHY74N7JAFRL4PFVZCNWW2ARI6ZEKNBJSMSKW7C"
[[VALIDATORS]]
ADDRESS="stellar-full-validator3.bdnodes.net"
HISTORY="curl -sf https://stellar-full-history3.bdnodes.net/{0} -o {1}"
HOME_DOMAIN="stellar.blockdaemon.com"
NAME="Blockdaemon Validator 3"
PUBLIC_KEY="GAYXZ4PZ7P6QOX7EBHPIZXNWY4KCOBYWJCA4WKWRKC7XIUS3UJPT6EZ4"
[[VALIDATORS]]
ADDRESS="finland.stellar.coinqvest.com"
HISTORY="curl -sf https://finland.stellar.coinqvest.com/history/{0} -o {1}"
HOME_DOMAIN="coinqvest.com"
NAME="coinqvest_fi"
PUBLIC_KEY="GADLA6BJK6VK33EM2IDQM37L5KGVCY5MSHSHVJA4SCNGNUIEOTCR6J5T"
[[VALIDATORS]]
ADDRESS="hongkong.stellar.coinqvest.com"
HISTORY="curl -sf https://hongkong.stellar.coinqvest.com/history/{0} -o {1}"
HOME_DOMAIN="coinqvest.com"
NAME="coinqvest_hk"
PUBLIC_KEY="GAZ437J46SCFPZEDLVGDMKZPLFO77XJ4QVAURSJVRZK2T5S7XUFHXI2Z"
[[VALIDATORS]]
ADDRESS="germany.stellar.coinqvest.com"
HISTORY="curl -sf https://germany.stellar.coinqvest.com/history/{0} -o {1}"
HOME_DOMAIN="coinqvest.com"
NAME="coinqvest_de"
PUBLIC_KEY="GD6SZQV3WEJUH352NTVLKEV2JM2RH266VPEM7EH5QLLI7ZZAALMLNUVN"
[[VALIDATORS]]
ADDRESS="stellar-de-fra.satoshipay.io"
HISTORY="curl -sf https://stellar-history-de-fra.satoshipay.io/{0} -o {1}"
HOME_DOMAIN="satoshipay.io"
NAME="satoshipay_de"
PUBLIC_KEY="GC5SXLNAM3C4NMGK2PXK4R34B5GNZ47FYQ24ZIBFDFOCU6D4KBN4POAE"
[[VALIDATORS]]
ADDRESS="stellar-sg-sin.satoshipay.io"
HISTORY="curl -sf https://stellar-history-sg-sin.satoshipay.io/{0} -o {1}"
HOME_DOMAIN="satoshipay.io"
NAME="satoshipay_sg"
PUBLIC_KEY="GBJQUIXUO4XSNPAUT6ODLZUJRV2NPXYASKUBY4G5MYP3M47PCVI55MNT"
[[VALIDATORS]]
ADDRESS="stellar-us-iowa.satoshipay.io"
HISTORY="curl -sf https://stellar-history-us-iowa.satoshipay.io/{0} -o {1}"
HOME_DOMAIN="satoshipay.io"
NAME="satoshipay_us"
PUBLIC_KEY="GAK6Z5UVGUVSEK6PEOCAYJISTT5EJBB34PN3NOLEQG2SUKXRVV2F6HZY"
[[VALIDATORS]]
ADDRESS="bootes.publicnode.org"
HISTORY="curl -sf https://bootes-history.publicnode.org/{0} -o {1}"
HOME_DOMAIN="publicnode.org"
NAME="bootes"
PUBLIC_KEY="GCVJ4Z6TI6Z2SOGENSPXDQ2U4RKH3CNQKYUHNSSPYFPNWTLGS6EBH7I2"
[[VALIDATORS]]
ADDRESS="hercules.publicnode.org"
HISTORY="curl -sf https://hercules-history.publicnode.org/{0} -o {1}"
HOME_DOMAIN="publicnode.org"
NAME="hercules"
PUBLIC_KEY="GBLJNN3AVZZPG2FYAYTYQKECNWTQYYUUY2KVFN2OUKZKBULXIXBZ4FCT"
[[VALIDATORS]]
ADDRESS="lyra.publicnode.org"
HISTORY="curl -sf https://lyra-history.publicnode.org/{0} -o {1}"
HOME_DOMAIN="publicnode.org"
NAME="lyra"
PUBLIC_KEY="GCIXVKNFPKWVMKJKVK2V4NK7D4TC6W3BUMXSIJ365QUAXWBRPPJXIR2Z"
[[VALIDATORS]]
ADDRESS="v1.stellar.lobstr.co"
HISTORY="curl -sf https://stellar-archive-1-lobstr.s3.amazonaws.com/{0} -o {1}"
HOME_DOMAIN="lobstr.co"
NAME="lobstr_1_eu"
PUBLIC_KEY="GCFONE23AB7Y6C5YZOMKUKGETPIAJA4QOYLS5VNS4JHBGKRZCPYHDLW7"
[[VALIDATORS]]
ADDRESS="v2.stellar.lobstr.co"
HISTORY="curl -sf https://stellar-archive-2-lobstr.s3.amazonaws.com/{0} -o {1}"
HOME_DOMAIN="lobstr.co"
NAME="lobstr_2_eu"
PUBLIC_KEY="GDXQB3OMMQ6MGG43PWFBZWBFKBBDUZIVSUDAZZTRAWQZKES2CDSE5HKJ"
[[VALIDATORS]]
ADDRESS="v3.stellar.lobstr.co"
HISTORY="curl -sf https://stellar-archive-3-lobstr.s3.amazonaws.com/{0} -o {1}"
HOME_DOMAIN="lobstr.co"
NAME="lobstr_3_north_america"
PUBLIC_KEY="GD5QWEVV4GZZTQP46BRXV5CUMMMLP4JTGFD7FWYJJWRL54CELY6JGQ63"
[[VALIDATORS]]
ADDRESS="v4.stellar.lobstr.co"
HISTORY="curl -sf https://stellar-archive-4-lobstr.s3.amazonaws.com/{0} -o {1}"
HOME_DOMAIN="lobstr.co"
NAME="lobstr_4_asia"
PUBLIC_KEY="GA7TEPCBDQKI7JQLQ34ZURRMK44DVYCIGVXQQWNSWAEQR6KB4FMCBT7J"
[[VALIDATORS]]
ADDRESS="v5.stellar.lobstr.co"
HISTORY="curl -sf https://stellar-archive-5-lobstr.s3.amazonaws.com/{0} -o {1}"
HOME_DOMAIN="lobstr.co"
NAME="lobstr_5_au"
PUBLIC_KEY="GA5STBMV6QDXFDGD62MEHLLHZTPDI77U3PFOD2SELU5RJDHQWBR5NNK7"
{{- end }}

##############################################
# Define default testnet config
{{- define "core.testnetConfig" -}}
PUBLIC_HTTP_PORT=true
HTTP_PORT=11626
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
