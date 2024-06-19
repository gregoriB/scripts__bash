### MDISK

## Simple script to mount a disk with Linux

Specify the full disk path, and then optionally the new mounted directory name.  If the mounted directory name is not specified, then it will have the same name as the disk specified in the path.

```sh
bash mdisk.sh <path to disk> [name of mounted directory]
```

If no new directory name is specified, then the existing disk name will be used.

### Example

```sh
bash mdisk.sh /dev/sda1 sandisk_ssd # mount disk at /dev/sda1 to /mnt/sandisk_ssd
```
