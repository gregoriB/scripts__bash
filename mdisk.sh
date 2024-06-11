path=$1
optional_name=$2

if [[ ! "$path" ]]; then
  echo "No mountable path specified"
  echo "Exiting"
  exit 1
fi

echo "Mounting $path"
prepared="${path%/}" # remove trailing slash
last="${prepared##*/}"

if [[ ! "$optional_name" ]]; then
  mount_path="/mnt/$last"
else
  mount_path="/mnt/$optional_name"
fi

sudo mkdir $mount_path
mount $path $mount_path
echo "Mounted to $mount_path"
