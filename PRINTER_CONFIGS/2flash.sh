#TYPE

sudo nano ~/update_klipper.sh

#ADD
 
read -p "Abort and Initiate Katapult mode on SKR3 by double tap reset button,Check if in Katapult? Run ls /dev/serial/by-id, Press [Enter] to continue, or [Ctrl+C] to abort"

sudo service klipper stop
cd ~/klipper
git pull

make clean KCONFIG_CONFIG=config.skr3
make menuconfig KCONFIG_CONFIG=config.skr3
make KCONFIG_CONFIG=config.skr3
read -p "SKR3 firmware built, please check above for any errors. Press [Enter] to continue flashing, or [Ctrl+C] to abort"

python3 ~/katapult/scripts/flashtool.py -f ~/klipper/out/klipper.bin -d /dev/serial/by-id/usb-katapult__stm32h723xx_18001C001651313238353730-if00
read -p "SKR3 firmware flashed, please check above for any errors. Press [Enter] to continue, or [Ctrl+C] to abort"

make clean KCONFIG_CONFIG=config.ebb42
make menuconfig KCONFIG_CONFIG=config.ebb42
make KCONFIG_CONFIG=config.ebb42
read -p "EBB42 firmware built, please check above for any errors. Press [Enter] to continue flashing, or [Ctrl+C] to abort"

python3 ~/katapult/scripts/flash_can.py -i can0 -u a732400db788 -r
python3 ~/katapult/scripts/flash_can.py -i can0 -u a732400db788 -f ~/klipper/out/klipper.bin
read -p "EBB42 firmware flashed, please check above for any errors. Press [Enter] to continue flashing, or [Ctrl+C] to abort"

make clean KCONFIG_CONFIG=config.rpi
make menuconfig KCONFIG_CONFIG=config.rpi
make KCONFIG_CONFIG=config.rpi
read -p "RPi firmware built, please check above for any errors. Press [Enter] to continue flashing, or [Ctrl+C] to abort"

make flash KCONFIG_CONFIG=config.rpi
read -p "RPi firmware flashed, please check above for any errors. Press [Enter] to continue flashing, or [Ctrl+C] to abort"

read -p "Flashing complete, now restarting Klipper"

sudo service klipper start


#TYPE
   ctrl x
#TYPE
   y
#TYPE
   enter


#Run to give permission- TYPE      

sudo chmod 777 ~/update_klipper.sh

#Run and check Katapult mode-  TYPE  

ls /dev/serial/by-id  

#Run to update-    TYPE           

~/update_klipper.sh


#E3MN_SKR 3_EBB42_U2C
#14/08/2024


#     MOBO                          Katapult Configuration v0.0.1-64-g3e23332
#     Micro-controller Architecture (STMicroelectronics STM32)  --->
#     Processor model (STM32H723)  --->
#     Build Katapult deployment application (128KiB bootloader (SKR SE BX v2.0))  --->
#     Clock Reference (25 MHz crystal)  --->
#     Communication interface (USB (on PA11/PA12))  --->
#     Application start offset (128KiB offset)  --->
#     USB ids  --->
# ()  GPIO pins to set on bootloader entry
# [*] Support bootloader entry on rapid double click of reset button
# [ ] Enable bootloader entry on button (or gpio) state
# [ ] Enable Status LED

#     MOBO                                Klipper Firmware Configuration
# [*] Enable extra low-level configuration options
#     Micro-controller Architecture (STMicroelectronics STM32)  --->
#     Processor model (STM32H723)  --->
#     Bootloader offset (128KiB bootloader)  --->
#     Clock Reference (25 MHz crystal)  --->
#     Communication interface (USB (on PA11/PA12))  --->
# ()  GPIO pins to set at micro-controller startup



#     EBB42                          Katapult Configuration v0.0.1-64-g3e23332
#     Micro-controller Architecture (STMicroelectronics STM32)  --->
#     Processor model (STM32G0B1)  --->
#     Build Katapult deployment application (8KiB bootloader)  --->
#     Clock Reference (8 MHz crystal)  --->
#     Communication interface (CAN bus (on PB0/PB1))  --->
#     Application start offset (8KiB offset)  --->
# (1000000) CAN bus speed
# ()  GPIO pins to set on bootloader entry
# [*] Support bootloader entry on rapid double click of reset button
# [ ] Enable bootloader entry on button (or gpio) state
# [*] Enable Status LED
# (PA13)  Status LED GPIO Pin


#      EBB42                               Klipper Firmware Configuration
# [*] Enable extra low-level configuration options
#     Micro-controller Architecture (STMicroelectronics STM32)  --->
#     Processor model (STM32G0B1)  --->
#     Bootloader offset (8KiB bootloader)  --->
#     Clock Reference (8 MHz crystal)  --->
#     Communication interface (CAN bus (on PB0/PB1))  --->
# (1000000) CAN bus speed
# ()  GPIO pins to set at micro-controller startup

#     RPi                                Klipper Firmware Configuration
# [*] Enable extra low-level configuration options
#     Micro-controller Architecture (Linux process)  --->
# ()  GPIO pins to set at micro-controller startup (NEW)


# This file contains common pin mappings for the BigTreeTech SKR 3.
# To use this config, the firmware should be compiled for the
# STM32H743 with a "128KiB bootloader".

# This file contains common pin mappings for the BIGTREETECH EBBCan
# Canbus board. To use this config, the firmware should be compiled for the
# STM32G0B1 with "8 MHz crystal" and "USB (on PA11/PA12)" or "CAN bus (on PB0/PB1)".
# The "EBB Can" micro-controller will be used to control the components on the nozzle.

# See docs/Config_Reference.md for a description of parameters.

[mcu]
#serial: /dev/serial/by-id/usb-Klipper_stm32h723xx_18001C001651313238353730-if00
#serial: /dev/serial/by-path/platform-fd500000.pcie-pci-0000:01:00.0-usb-0:1.1:1.0
#serial: /dev/ttyAMA0
#restart_method: command

[mcu EBBCan]
# serial: /dev/serial/by-id/usb-Klipper_stm32g0b1xx_320035000E50425539393020-if00
#serial: /dev/serial/by-path/platform-fd500000.pcie-pci-0000:01:00.0-usb-0:1.4:1.0
#canbus_uuid: a732400db788