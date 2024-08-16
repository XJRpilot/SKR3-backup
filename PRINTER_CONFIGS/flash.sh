#TYPE -
sudo nano ~/update_klipper.sh

#ADD (COPY AND PASTE) INTO FILE    ###################################

# read -p "Abort and Initiate Katapult mode on SKR3 by double tap reset button,Check if in Katapult? Run ls /dev/serial/by-id, Press [Enter] to continue, or [Ctrl+C] to abort"
# read -p "Abort and Initiate Katapult mode on EBB42 by ____,Check if in Katapult? Run ls /dev/serial/by-id, Press [Enter] to continue, or [Ctrl+C] to abort"
# read -p "Abort and Initiate DFU mode,Check if in Katapult? Run ls /dev/serial/by-id, Press [Enter] to continue, or [Ctrl+C] to abort"

sudo service klipper stop
cd ~/klipper
git pull

# #SKR3 - KLIPPER 
# make clean KCONFIG_CONFIG=config.skr3
# make menuconfig KCONFIG_CONFIG=config.skr3
# make KCONFIG_CONFIG=config.skr3
# read -p "SKR3 firmware built, please check above for any errors. Press [Enter] to continue flashing, or [Ctrl+C] to abort"
# python3 ~/katapult/scripts/flashtool.py -f ~/klipper/out/klipper.bin -d /dev/serial/by-id/usb-katapult_stm32h723xx_<YOUR MOBO ID>
# read -p "SKR3 firmware flashed, please check above for any errors. Press [Enter] to continue, or [Ctrl+C] to abort"

# #EBB42 - KATAPULT
# cd ~/katapult
# make clean KCONFIG_CONFIG=config.ebb42
# make menuconfig KCONFIG_CONFIG=config.ebb42
# make KCONFIG_CONFIG=config.ebb42
# read -p "EBB42 Katapult firmware built, please check above for any errors. Press [Enter] to continue flashing, or [Ctrl+C] to abort"
# sudo dfu-util -R -a 0 -s 0x08000000:force:mass-erase:leave -D ~/katapult/out/katapult.bin -d 0483:df11
# read -p "EBB42 Katapult firmware flashed, please check above for any errors. Press [Enter] to continue flashing, or [Ctrl+C] to abort"

# #EBB42 - KLIPPER 
# cd ~/klipper
# make clean KCONFIG_CONFIG=config.ebb42
# make menuconfig KCONFIG_CONFIG=config.ebb42
# make KCONFIG_CONFIG=config.ebb42
# read -p "EBB42 klipper firmware built, please check above for any errors. Press [Enter] to continue flashing, or [Ctrl+C] to abort"
#EBB42 - CAN
#python3 ~/katapult/scripts/flash_can.py -i can0 -u <your UUID> -r                                              #for CAN
#python3 ~/katapult/scripts/flash_can.py -i can0 -u <your UUID> -f ~/klipper/out/klipper.bin                    #for CAN
#read -p "EBB42 klipper firmware flashed, please check above for any errors. Press [Enter] to continue flashing, or [Ctrl+C] to abort"
#EBB42 - usb
#python3 ~/katapult/scripts/flashtool.py -f ~/klipper/out/klipper.bin -d /dev/serial/by-id/usb <your MOBO ID>   #for USB
#read -p "EBB42 firmware flashed, please check above for any errors. Press [Enter] to continue flashing, or [Ctrl+C] to abort"
#read -p "EBB42 klipper firmware flashed, please check above for any errors. Press [Enter] to continue flashing, or [Ctrl+C] to abort"

# #RPi - LINUX 
# make clean KCONFIG_CONFIG=config.rpi
# make menuconfig KCONFIG_CONFIG=config.rpi
# make KCONFIG_CONFIG=config.rpi
# read -p "RPi firmware built, please check above for any errors. Press [Enter] to continue flashing, or [Ctrl+C] to abort"
# make flash KCONFIG_CONFIG=config.rpi
# read -p "RPi firmware flashed, please check above for any errors. Press [Enter] to continue flashing, or [Ctrl+C] to abort"

#ADXL345 - RP2040
#make clean KCONFIG_CONFIG=config.adxl345
#make menuconfig KCONFIG_CONFIG=config.adxl345
#make KCONFIG_CONFIG=config.adxl345
#read -p "adxl345 firmware built, please check above for any errors. Press [Enter] to continue flashing, or [Ctrl+C] to abort"
#make flash FLASH_DEVICE=/dev/serial/by-id/usb-Klipper_rp2040
#read -p "adxl345 firmware flashed, please check above for any errors. Press [Enter] to continue flashing, or [Ctrl+C] to abort"

#BTT-EDDY - RP2040
#make clean KCONFIG_CONFIG=config.eddy
#make menuconfig KCONFIG_CONFIG=config.eddy
#make KCONFIG_CONFIG=config.eddy
#read -p "eddy firmware built, please check above for any errors. Press [Enter] to continue flashing, or [Ctrl+C] to abort"
#make flash FLASH_DEVICE=2e8a:0003                               #initial flash
#make flash FLASH_DEVICE=/dev/serial/by-id/usb-Klipper_rp2040    #maybe for update
#read -p "eddy firmware flashed, please check above for any errors. Press [Enter] to continue flashing, or [Ctrl+C] to abort"

read -p "Flashing complete, now restarting Klipper"

sudo service klipper start

#TYPE - ctrl x
#     - y
#     -enter
				   
#TYPE AND ENTER to give permission -       sudo chmod 777 ~/update_klipper.sh

#Initiate Katapult mode by - DOUBLE TAP RESET BUTON

#TYPE AND ENTER to check Katapult mode -   ls /dev/serial/by-id  

#TYPE AND ENTER  to update-                ~/update_klipper.sh



#            THIS BOARD USES KATAPULT, DOUBLE CLICK RESET BUTTON TO ACCESS KATAPULT MODE

#     MOBO                         Katapult Configuration v0.0.1-64-g3e23332
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
#     Communication interface (USB (on PA11/PA12))  --->      #Communication interface (USB to CAN bus bridge (USB on PA11/PA12))  --->
#                                                             #CAN bus interface (CAN bus (on PB8/PB9))  --->
#     USB ids  --->
#                                                             #(1000000) CAN bus speed
# ()  GPIO pins to set at micro-controller startup

#     EBB42                          Katapult Configuration v0.0.1-64-g3e23332
#     Micro-controller Architecture (STMicroelectronics STM32)  --->
#     Processor model (STM32G0B1)  --->
#     Build Katapult deployment application (8KiB bootloader)  --->
#     Clock Reference (8 MHz crystal)  --->
#     Communication interface (USB (on PA11/PA12))  --->    #Communication interface (CAN bus (on PB0/PB1))  --->
#     Application start offset (8KiB offset)  --->
#      USB ids  --->                                        #(1000000) CAN bus speed
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
#     Communication interface (USB (on PA11/PA12))  --->    #Communication interface (CAN bus (on PB0/PB1))  --->
#     USB ids  --->                                         #(1000000) CAN bus speed
# ()  GPIO pins to set at micro-controller startup

#     RPi                                Klipper Firmware Configuration
# [*] Enable extra low-level configuration options
#     Micro-controller Architecture (Linux process)  --->
# ()  GPIO pins to set at micro-controller startup

#      ADXL345                             Klipper Firmware Configuration
#[*] Enable extra low-level configuration options
#    Micro-controller Architecture (Raspberry Pi RP2040)  --->
#    Bootloader offset (No bootloader)  --->
#    Flash chip (W25Q080 with CLKDIV 2)  --->
#    Communication Interface (USBSERIAL)  --->
#    USB ids  --->
#()  GPIO pins to set at micro-controller startup

#   BTT-EDDY-usb                                Klipper Firmware Configuration
#[*] Enable extra low-level configuration options
#    Micro-controller Architecture (Raspberry Pi RP2040)  --->
#    Bootloader offset (No bootloader)  --->
#    Flash chip (W25Q080 with CLKDIV 2)  --->
#    Communication Interface (USBSERIAL)  --->
#    USB ids  --->
#()  GPIO pins to set at micro-controller startup