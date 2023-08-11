{ pkgs, inputs, ... }: {

  imports = [
    inputs.impermanence.nixosModules.impermanence
  ];

  # impermanence
  environment.persistence."/work/host" = {
    directories = [
      # network
      "/var/lib/NetworkManager"
      "/etc/NetworkManager/system-connections"
    ];
    files = [
      # machine-id
      "/etc/machine-id"
    ];
  };

  # sudo mkdir -p /work/host/etc/lib
  # sudo cp -r /etc/machine-id /work/host/etc/machine-id

  # erase root on boot
  boot.initrd.postDeviceCommands = pkgs.lib.mkBefore ''

    # mount device
    mkdir -p /mnt
    mount -o subvol=/ /dev/sda2 /mnt

    # delete subvolumes
    btrfs subvolume list -o /mnt/root |
    cut -f9 -d' ' |
    while read subvolume; do
      echo "deleting /$subvolume subvolume..."
      btrfs subvolume delete "/mnt/$subvolume"
    done &&
    echo "deleting /root subvolume..." &&
    btrfs subvolume delete /mnt/root

    echo "restoring blank /root subvolume..."
    btrfs subvolume snapshot /mnt/empty /mnt/root

    # unmount /mnt
    umount /mnt
  '';
}


