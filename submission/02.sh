# Count the new transaction outputs created by block 243,825.
bitcoin-cli -signet getblockstats 243825 '["outs"]' | jq -r '.outs'
