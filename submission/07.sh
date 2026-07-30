# Get the coinbase transaction from block 243,834.
block_hash=$(bitcoin-cli -signet getblockhash 243834)
bitcoin-cli -signet getblock "$block_hash" | jq -r '.tx[0]'
