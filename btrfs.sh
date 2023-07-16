# blacklist
blacklist=(
  /tmp
)

# create mnt directory
sudo mkdir -p /mnt

# mount btrfs partition
if ! mountpoint -q /mnt; then
  sudo mount /dev/sda2 /mnt 
fi

# empty volume marker
empty=$( sudo btrfs subvolume find-new /mnt/empty 9999999 | cut -d' ' -f4- )

# list all new files in volume root
files=$( 
  sudo btrfs subvolume find-new "/mnt/root" ${empty} |
  sed '$d' |
  cut -d' ' -f17-  |
  sort |
  uniq 
)

# iterate over file list to show difference
while read file; do 
  file="/$file"

  # show only files
  if [ -f "$file" ] && [ ! -L "$file" ]; then

    # show only itens not present in blacklist
    for item in "${blacklist[@]}"; do
      match=0
      if [[ $file == "$item"* ]]; then
        match=1
        break
      fi
    done
    if [[ $match = 0 ]]; then
      echo $file
    fi

  fi
done <<< "$files"

sudo umount /mnt
