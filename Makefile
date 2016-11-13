# Text patch tool
TP=patch

# Binary patch tool
BP=bspatch

all: copy_oss copy_nonfree install/motion.out install/probe.nc install/slib.nc

copy_oss: oss/eng oss/gotoz.nc oss/m30.nc oss/null.nc oss/pause.nc oss/safez.nc oss/systemLib.nc
	cp oss/eng oss/gotoz.nc oss/m30.nc oss/null.nc oss/pause.nc oss/safez.nc oss/systemLib.nc install/
	
copy_nonfree: org/chs
	cp org/chs install/

install/motion.out: org/motion.out patch/motion.patch
	$(BP) org/motion.out install/motion.out patch/motion.patch
	chmod +x install/motion.out

install/probe.nc: org/probe.nc patch/probe.patch
	$(TP) org/probe.nc patch/probe.patch -o install/probe.nc
	
install/slib.nc: org/slib.nc patch/slib.patch
	$(TP) org/slib.nc patch/slib.patch -o install/slib.nc
	
clean:
	rm install/*
