rm vesting_contract.plutus
cabal clean
cabal build -w ghc-8.10.4 -O2
cabal run vesting-contract
echo "DONE"