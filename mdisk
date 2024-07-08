if [[ ! "$1" ]]; then
  echo
  echo "!! ERROR: Missing specified disk path !!"
  echo "Usage: $ mdisk <path_to_disk> [mounted name]"
  echo "!! Exiting !!"
  echo
  exit 1
fi

disk_path=$1
optional_mount_name=$2

if [[ ! -b "$disk_path" ]]; then
  echo
  echo "!! ERROR: Specified disk path is not mountable !!"
  echo "!! Exiting !!"
  echo
  exit 1
fi

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
    echo "Please remove this directory"
    echo "!! Exiting !!"
    echo
    exit 1
  fi
fi

sudo mkdir $mount_path
echo "$mount_path directory created"

echo "Mounting $disk_path"
sudo mount $disk_path $mount_path

echo
echo "$disk_path mounted to $mount_path"

echo
echo "Sanity check for $mount_path: "
ls -a $mount_path

echo
echo "Have a nice day!!"
echo
