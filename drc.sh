echo "Please enter the KMS Endpoint URL"
read ENDPOINT
echo "Please enter the KMS Key OCID"
read KEY
echo "Please enter the Encrypted Text (Above)"
read CIPHER_TEXT
echo "Plain Text"
decrypted=$(oci kms crypto decrypt --key-id "$KEY" --endpoint "$ENDPOINT" --cip$
echo $decrypted
export plain=$(echo $decrypted | jq -r '.data | .plaintext')
echo $plain | base64 --decode
