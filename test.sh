#! /bin/sh

echo "Begin shell server test"

# Generate a random UUID
# from https://gist.github.com/earthgecko/3089509
RAND_UUID=$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 32 | head -n 1)
echo "Generated UUID $RAND_UUID"

echo "Creating a test file and filling with the random UUID"
touch test.bin
echo $RAND_UUID > test.bin

# Uploading to server
curl --proxy-user user:pass --form "file=@test.bin" --silent http://webstorage/cgi-bin/upload.cgi

# Deleting original file
rm test.bin

# Downloading from server
#wget --http-user=user --http-password=pass http://webstorage/uploads/test.bin /!\ broken
wget --http-user=user --http-password=pass http://webstorage/test.bin

# Reading downloaded file
DOWN_UUID=`cat test.bin`
echo "Downloaded UUID $DOWN_UUID"

# Deleting downloaded file
rm test.bin

# Comparing data
if [ "$RAND_UUID" = "$DOWN_UUID" ]; then
	echo "Check OK !"
else
	echo "Check KO, something gone wrong !"
fi
