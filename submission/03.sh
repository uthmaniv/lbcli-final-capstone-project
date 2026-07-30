# Which tx in block 216,351 spends the coinbase output of block 216,128?
coinbase_tx=$(bitcoin-cli -signet getblock 00000131f50f2c9b2ed339afa6ab596a5d796b2fca5054379ddd28ae6a705a9b | jq -r '.tx[0]')

# Find the transaction in block 216,351 that spends an output from that coinbase transaction.
bitcoin-cli -signet getblock 0000012ab18ca6b2a6cf0a4dc903fabdb1a554c20f13ef59083d1a4368456fee 2 | jq -r --arg txid "$coinbase_tx" '.tx[] | select(any(.vin[]?; .txid == $txid)) | .txid'