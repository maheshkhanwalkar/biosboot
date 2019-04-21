# biosboot
Legacy BIOS Bootloader

This bootloader is meant for booting a custom kernel, although maybe extended in the future to conform to particular specs, like Multiboot or Linux boot standards.

The architecture of the bootloader will be multi-stage, with support for both DOS (MBR) and GPT partition tables. In addition, there will be support for the ext2 filesystem, though others may be added at a later time.

The compiled result can be installed using [prepdisk](https://github.com/maheshkhanwalkar/prepdisk), which will merge the binary with a pre-existing partition table, committing the result back to disk.
