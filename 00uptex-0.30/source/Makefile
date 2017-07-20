MAKEJVF =  makejvf
PLTOTF  = uppltotf -kanji=uptex
MAKEJVFJ  = $(MAKEJVF) -i -u jis

all: tfm vf

PRESTR = "s/DESIGNSIZE R 10\.0/DESIGNSIZE R #
POSTSTR = \.0/"

pl:
	sed -e 's/MINCHO/GOTHIC/' -e 's/MRR/BRR/' umin10.pl > ugoth10.pl
	sed -e 's/MINCHO/GOTHIC/' -e 's/MRR/BRR/' utmin10.pl > utgoth10.pl

tfm:
	$(PLTOTF) umin10.pl   umin10.tfm
	$(PLTOTF) ugoth10.pl  ugoth10.tfm
	$(PLTOTF) utmin10.pl  utmin10.tfm
	$(PLTOTF) utgoth10.pl utgoth10.tfm
	for fnt in ujis ujisg ; do \
		$(PLTOTF) ujis.pl    $$fnt.tfm ; \
	done
	for fnt in ujis-v ujisg-v ; do \
		$(PLTOTF) ujis-v.pl  $$fnt.tfm ; \
	done
	for fnt in ujisn ujisng ; do \
		$(PLTOTF) ujisn.pl   $$fnt.tfm ; \
	done
	for fnt in ujisn-v ujisng-v ; do \
		$(PLTOTF) ujisn-v.pl $$fnt.tfm ; \
	done

vf:
	$(MAKEJVFJ) -J rml  umin10.tfm   urml
	$(MAKEJVFJ) -J gbm  ugoth10.tfm  ugbm
	$(MAKEJVFJ) utmin10.tfm  urmlv
	$(MAKEJVFJ) utgoth10.tfm ugbmv
	$(MAKEJVFJ) -J rml ujis.tfm     urml
	$(MAKEJVFJ) -J rml ujisn.tfm    urml
	$(MAKEJVFJ) ujis-v.tfm   urmlv
	$(MAKEJVFJ) ujisn-v.tfm  urmlv
	$(MAKEJVFJ) -J gbm ujisg.tfm    ugbm
	$(MAKEJVFJ) -J gbm ujisng.tfm   ugbm
	$(MAKEJVFJ) ujisg-v.tfm  ugbmv
	$(MAKEJVFJ) ujisng-v.tfm ugbmv
	rm -f rml.tfm gbm.tfm

pl5:
	sed -e 's/MINCHO/GOTHIC/' -e 's/MRR/BRR/' umin10.pl > ugoth10.pl
	sed -e 's/MINCHO/GOTHIC/' -e 's/MRR/BRR/' utmin10.pl > utgoth10.pl
	for pt in 5 6 7 8 9; do \
		sed -e $(PRESTR)$$pt$(POSTSTR) umin10.pl > umin$$pt.pl ; \
		sed -e $(PRESTR)$$pt$(POSTSTR) ugoth10.pl > ugoth$$pt.pl ; \
		sed -e $(PRESTR)$$pt$(POSTSTR) utmin10.pl > utmin$$pt.pl ; \
		sed -e $(PRESTR)$$pt$(POSTSTR) utgoth10.pl > utgoth$$pt.pl ; \
	done

tfm5:
	for pt in 5 6 7 8 9 10; do \
		$(PLTOTF) umin$$pt.pl   umin$$pt.tfm ; \
		$(PLTOTF) ugoth$$pt.pl  ugoth$$pt.tfm ; \
		$(PLTOTF) utmin$$pt.pl  utmin$$pt.tfm ; \
		$(PLTOTF) utgoth$$pt.pl utgoth$$pt.tfm ; \
	done

vf5:
	for pt in 5 6 7 8 9 10; do \
		$(MAKEJVFJ) -J rml  umin$$pt.tfm   urml ; \
		$(MAKEJVFJ) -J gbm  ugoth$$pt.tfm  ugbm ; \
		$(MAKEJVFJ) utmin$$pt.tfm  urmlv ; \
		$(MAKEJVFJ) utgoth$$pt.tfm ugbmv ; \
	done

move:
	mkdir -pv ../../tfm ../../vf
	for fnt in min10 goth10 tmin10 tgoth10; do \
		mv u$$fnt.tfm ../../tfm ; \
		mv u$$fnt.vf ../../vf ; \
	done
	for fnt in rml gbm rmlv gbmv; do \
		mv u$$fnt.tfm ../../tfm ; \
	done
	mkdir -pv ../tfm ../vf
	mv *.tfm ../tfm
	mv *.vf ../vf
