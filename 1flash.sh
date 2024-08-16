  GNU nano 5.4 
  /home/kev/update_klipper.sh 
  
read -p "Abort and Initiate Katapult mode on SKR3 and EBB42 by double tap reset button,Check if in Katapult? Run ls /dev/serial/by-id, Press [Enter] to continue, or [Ctrl+C] to abort"

sudo service klipper stop
cd ~/klipper
git pull

make clean KCONFIG_CONFIG=config.skr3
make menuconfig KCONFIG_CONFIG=config.skr3
make KCONFIG_CONFIG=config.skr3
read -p "SKR3 firmware built, please check above for any errors. Press [Enter] to continue flashing, or [Ctrl+C] to abort"
python3 ~/katapult/scripts/flashtool.py -f ~/klipper/out/klipper.bin -d /dev/serial/by-id/usb-katapult_stm32h723xx_18001C001651313238353730-if00
read -p "SKR3 firmware flashed, please check above for any errors. Press [Enter] to continue, or [Ctrl+C] to abort"

#cd ~/katapult
#make clean KCONFIG_CONFIG=config.ebb42
#make menuconfig KCONFIG_CONFIG=config.ebb42
#make KCONFIG_CONFIG=config.ebb42
#read -p "EBB42 Katapult firmware built, please check above for any errors. Press [Enter] to continue flashing, or [Ctrl+C] to abort"
#sudo dfu-util -R -a 0 -s 0x08000000:force:mass-erase:leave -D ~/katapult/out/katapult.bin -d 0483:df11
#read -p "EBB42 Katapult firmware flashed, please check above for any errors. Press [Enter] to continue flashing, or [Ctrl+C] to abort"

cd ~/klipper
make clean KCONFIG_CONFIG=config.ebb42
make menuconfig KCONFIG_CONFIG=config.ebb42
make KCONFIG_CONFIG=config.ebb42
read -p "EBB42 klipper firmware built, please check above for any errors. Press [Enter] to continue flashing, or [Ctrl+C] to abort"
python3 ~/katapult/scripts/flashtool.py -f ~/klipper/out/klipper.bin -d /dev/serial/by-id/usb-katapult_stm32g0b1xx_2E0020001450425539393020-if00
read -p "EBB42 klipper firmware flashed, please check above for any errors. Press [Enter] to continue flashing, or [Ctrl+C] to abort"

#python3 ~/katapult/scripts/flash_can.py -i can0 -u <your UUID> -r                                              #for CAN
#python3 ~/katapult/scripts/flash_can.py -i can0 -u <your UUID> -f ~/klipper/out/klipper.bin                    #for CAN

#python3 ~/katapult/scripts/flashtool.py -f ~/klipper/out/klipper.bin -d /dev/serial/by-id/usb <your MOBO ID>   #for USB
#read -p "EBB42 firmware flashed, please check above for any errors. Press [Enter] to continue flashing, or [Ctrl+C] to abort"

make clean KCONFIG_CONFIG=config.rpi
make menuconfig KCONFIG_CONFIG=config.rpi
make KCONFIG_CONFIG=config.rpi
read -p "RPi firmware built, please check above for any errors. Press [Enter] to continue flashing, or [Ctrl+C] to abort"

make flash KCONFIG_CONFIG=config.rpi
read -p "RPi firmware flashed, please check above for any errors. Press [Enter] to continue flashing, or [Ctrl+C] to abort"

#make clean KCONFIG_CONFIG=config.adxl345
#make menuconfig KCONFIG_CONFIG=config.adxl345
#make KCONFIG_CONFIG=config.adxl345
#read -p "adxl345 firmware built, please check above for any errors. Press [Enter] to continue flashing, or [Ctrl+C] to abort"

#make flash FLASH_DEVICE=/dev/serial/by-id/usb-Klipper_rp2040
#read -p "adxl345 firmware flashed, please check above for any errors. Press [Enter] to continue flashing, or [Ctrl+C] to abort"

read -p "Flashing complete, now restarting Klipper. Press [Enter] to continue flashing, or [Ctrl+C] to abort"

sudo service klipper start
