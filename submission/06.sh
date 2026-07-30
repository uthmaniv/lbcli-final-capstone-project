# Find the transaction in block 243,821 that signals opt-in RBF.
block_hash=$(bitcoin-cli -signet getblockhash 243821)

bitcoin-cli -signet getblock "$block_hash" 2 |
  jq -r '.tx[]
    | select(any(.vin[]?; .sequence < 4294967294))
    | .txid'
