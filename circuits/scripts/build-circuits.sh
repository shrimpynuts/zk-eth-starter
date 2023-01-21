#!/bin/bash

PHASE1=../../circuits/pot24_final.ptau
BUILD_DIR=../../build/eth_tx
CIRCUIT_NAME=eth_tx


# Compile circuit
circom ./circuits/circuit.circom --wasm --r1cs -o ./build/

# # Generate witness
# node ./build/circuit_js/generate_witness.js ./build/circuit_js/circuit.wasm ./circuits/input.json ./build/output.wtns

# Phase 1
# snarkjs powersoftau contribute pot12_0000.ptau pot12_0001.ptau --name="First contribution" -v -e="random text for entropy"

# Verify phase 1
# snarkjs powersoftau verify pot12_0001.ptau

# Phase 1 apply a random beacon
# snarkjs powersoftau beacon pot12_0001.ptau pot12_beacon.ptau 0102030405060708090a0b0c0d0e0f101112131415161718191a1b1c1d1e1f 10 -n="Final Beacon"

# Prepare phase 2 
# snarkjs powersoftau prepare phase2 pot12_beacon.ptau pot12_final.ptau -v

# Verify phase 2 ptau

# Generate zkey
# snarkjs groth16 setup circuit.r1cs pot12_final.ptau circuit_final.zkey

# Verify zkey
# snarkjs zkey verify ./build/circuit.r1cs pot12_final.ptau circuit_final.zkey

# Export verification key
# snarkjs zkey export verificationkey circuit_final.zkey verification_key.json

# Turn verifier into smart contract
snarkjs zkey export solidityverifier circuit_final.zkey ./contracts/verifier.sol

# Generate proof
# snarkjs zkey verify ./build/circuit.r1cs pot12_final.ptau circuit_final.zkey

# Verify proof
# snarkjs groth16 verify verification_key.json public.json proof.json