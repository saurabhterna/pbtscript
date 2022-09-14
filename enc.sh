echo "Please enter the KMS Endpoint URL"
read ENDPOINT
echo "Please enter the KMS Key OCID"
read KEY
echo "Please enter the text you wish to encrypt"
read PLAIN_TEXT
echo "Encrypted Text"
encrypted=$(oci kms crypto encrypt --key-id "$KEY" --endpoint "$ENDPOINT" --pla$
export cipher=$(echo $encrypted | jq -r '.data | .ciphertext')
echo $cipher
