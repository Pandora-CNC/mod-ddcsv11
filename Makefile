# Text patch tool
TP=patch

# Binary patch tool
BP=bspatch

all: copy_oss copy_nonfree install/motion.out

copy_oss: oss/eng oss/gotoz.nc oss/m30.nc oss/null.nc oss/pause.nc oss/safez.nc oss/systemLib.nc
	cp oss/eng oss/gotoz.nc oss/m30.nc oss/null.nc oss/pause.nc oss/safez.nc oss/systemLib.nc install/
	
copy_nonfree: org/chs org/probe.nc org/setting org/slib.nc
	cp org/chs org/probe.nc org/setting org/slib.nc install/

install/motion.out: org/motion.out patch/motion.patch
	$(BP) org/motion.out install/motion.out patch/motion.patch

clean:
    rm install/*
