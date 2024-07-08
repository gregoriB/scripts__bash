echo "Controlled Pacman Running"

if [[ ! "$1" ]]; then
  echo
  echo "!! ERROR: Missing command !!"
  echo "Usage: $ cpacman [options]"
  echo "Use pacman -h for more details"
  echo "!! Exiting !!"
  echo
  exit 1
fi

args=("$@")
command=$1
rest_args=("${args[@]:1}")
packages_dir="$HOME/.config/packages"

sudo pacman $command $rest_args

if [[ ! -d $packages_dir ]]; then
  mkdir $HOME/.config/packages
fi

sudo pacman -Qe > $packages_dir/user_installed.txt
sudo pacman -Qd > $packages_dir/dependencies.txt

echo "Packages lists downloaded to $packages_dir"
