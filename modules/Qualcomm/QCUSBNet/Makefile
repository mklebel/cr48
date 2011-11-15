### BEGIN Makefile #######################################
obj-m += QCUSBNet2k.o
QCUSBNet2k-objs += QCUSBNet.o QMIDevice.o QMI.o

KDIR := /lib/modules/$(shell uname -r)
PWD  := $(shell pwd)

all: default

default:
	$(MAKE) -C $(KDIR)/build SUBDIRS=$(PWD) modules

clean:
	$(MAKE) -C $(KDIR)/build SUBDIRS=$(PWD) clean
	@rm -f modules.order
	@rm -f Module.markers
	@rm -f *~

install:
	cp QCUSBNet2k.ko $(KDIR)/kernel/drivers/net/usb/
	depmod -a

uninstall:
	rm $(KDIR)/kernel/drivers/net/usb/QCUSBNet2k.ko
	rmmod QCUSBNet2k
### EOF Makefile ##########################################
