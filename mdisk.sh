path=$1
optional_name=$2

if [[ ! "$path" ]]; then
  echo
  echo "!!!!!!!!!!!!!!!!"
  echo "No mountable path specified"
  echo "Exiting"
  exit 1
fi

echo_arg "Mounting $path"
prepared="${path%/}" # remove trailing slash
last="${prepared##*/}"

if [[ ! "$optional_name" ]]; then
  mount_path="/mnt/$last"
else
  mount_path="/mnt/$optional_name"
fi

if [[ -d "$mount_path" ]]; then
  sudo rm -rf $mount_path
  echo "Existing directory $mount_path removed"
fi

sudo mkdir $mount_path
echo "$mount_path directory created"

sudo mount $path $mount_path
echo
echo "$path mounted to $mount_path"

echo
echo "Sanity check for $mount_path: "
ls -a $mount_path

echo
echo "Have a nice day!!"
echo
