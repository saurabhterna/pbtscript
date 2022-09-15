echo "Please enter the OCI Vault Cryptographic Endpoint URL"
read ENDPOINT
echo "Please enter your Master Encryption Key OCID"
read KEY
echo "Please enter the Encrypted Text (Genreated Above)"
read CIPHER_TEXT
echo "---------- Output1 ----------"
oci kms crypto decrypt --key-id "$KEY" --endpoint "$ENDPOINT" --ciphertext $CIPHER_TEXT
decrypted=$(oci kms crypto decrypt --key-id "$KEY" --endpoint "$ENDPOINT" --ciphertext $CIPHER_TEXT)
export plain=$(echo $decrypted | jq -r '.data | .plaintext')
echo "---------- Plain Text ----------"
echo $plain | base64 --decode
echo "------------------------------------"
