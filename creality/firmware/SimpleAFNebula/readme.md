# Simple AF Nebula Base Firmware

This firmware is preparation for future support for running Simple AF on a Nebula pad with various Ender 3 machines, but without having to go through the onerous setup
process on the stock Nebula firmware.

## Features

- Pre-rooted
- The UI is replaced with a minimal UI just to setup WIFI, the bootstrap app is using the same functionality as the Wifi Panel from Grumpyscreen
- The emergency factory reset <https://pellcorp.github.io/creality-wiki/emergency_factory_reset/>
- Configure wifi via usb <https://pellcorp.github.io/creality-wiki/configure_wifi/#configure-wifi-via-usb>

## Gotchas

This firmware does NOT have klipper, the expecation in the future is that users planning to take advantage of Simple AF on a Nebula Pad will flash their
Nebula pad with this base firmware and then login via ssh and setup Simple AF.

## How do I login?

You need to setup wifi either via usb or the bootstrap ui and once you have an IP Address, you can ssh into the printer with:

```
ssh root@THE_IP_ADDRESS
```

The password is `Creality2023`




