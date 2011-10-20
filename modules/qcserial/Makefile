obj-m		    += usbserial.o
usbserial-y 	:= usb-serial.o generic.o bus.o
obj-m       	+= usb_wwan.o
obj-m		    += qcserial.o

all:
	make -C /lib/modules/$(shell uname -r)/build M=$(PWD) modules
clean:
	make -C /lib/modules/$(shell uname -r)/build M=$(PWD) clean
