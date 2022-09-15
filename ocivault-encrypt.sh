echo "Please enter the OCI Vault Cryptographic Endpoint URL"
read ENDPOINT
echo "Please enter your Master Encryption Key OCID"
read KEY
echo "Please enter the text you wish to encrypt"
read PLAIN_TEXT
oci kms crypto encrypt --key-id "$KEY" --endpoint "$ENDPOINT" --plaintext "$( echo $PLAIN_TEXT | base64 -w0 )"
echo "---------- Encrypted Text ----------"
encrypted=$(oci kms crypto encrypt --key-id "$KEY" --endpoint "$ENDPOINT" --plaintext "$( echo $PLAIN_TEXT | base64 -w0 )")
export cipher=$(echo $encrypted | jq -r '.data | .ciphertext')
echo $cipher
echo "------------------------------------"
