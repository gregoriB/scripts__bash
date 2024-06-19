disk_path=$1
optional_mount_name=$2

if [[ ! "$disk_path" ]]; then
  echo
  echo "!! ERROR: No mountable path specified !!"
  echo "!! Exiting !!"
  echo
  exit 1
fi

if [[ -d "$disk_path" ]]; then
  sudo rm -rf $mount_path
  echo "Existing directory $mount_path removed"
fi

echo "Mounting $disk_path"

if [[ "$optional_mount_name" ]]; then
  mount_path="/mnt/$optional_mount_name"
else
  deslashed="${disk_path%/}" # remove trailing slash
  disk_name="${deslashed##*/}" # get disk name from end of disk path
  mount_path="/mnt/$disk_name"
fi

if [[ -d "$mount_path" ]]; then
  if [[ -z "$(ls -A $mount_path)" ]]; then
    sudo rm -r $mount_path
    echo "Existing empty directory at $mount_path removed"
  else
    echo
    echo "!! ERROR: $mount_path is not empty !!"
    echo "!! Exiting !!"
    echo
    exit 1
  fi
fi

sudo mkdir $mount_path
echo "$mount_path directory created"

sudo mount $disk_path $mount_path
echo
echo "$disk_path mounted to $mount_path"

echo
echo "Sanity check for $mount_path: "
ls -a $mount_path

echo
echo "Have a nice day!!"
echo
