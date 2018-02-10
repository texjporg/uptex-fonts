TEXMF = $(shell kpsewhich -var-value=TEXMFHOME)
PWDF = $(shell pwd)

.PHONY: default install clean
default:
	cd $(PWDF)/source ; make ; make move
	cd $(PWDF)/00uptex-0.30/source ; make ; make move
install:
	mkdir -p ${TEXMF}/doc/fonts/uptex-fonts
	cp ./LICENSE ${TEXMF}/doc/fonts/uptex-fonts/
	cp ./README.md ${TEXMF}/doc/fonts/uptex-fonts/
	cp ./*.txt ${TEXMF}/doc/fonts/uptex-fonts/
	mkdir -p ${TEXMF}/fonts/cmap/uptex-fonts
	cp ./cmap/* ${TEXMF}/fonts/cmap/uptex-fonts/
	mkdir -p ${TEXMF}/fonts/source/uptex-fonts
	cp ./source/* ${TEXMF}/fonts/source/uptex-fonts/
	mkdir -p ${TEXMF}/fonts/tfm/uptex-fonts/min
	cp ./tfm/ugb* ${TEXMF}/fonts/tfm/uptex-fonts/min/
	cp ./tfm/urml* ${TEXMF}/fonts/tfm/uptex-fonts/min/
	cp ./tfm/*10* ${TEXMF}/fonts/tfm/uptex-fonts/min/
	mkdir -p ${TEXMF}/fonts/tfm/uptex-fonts/jis
	cp ./tfm/up* ${TEXMF}/fonts/tfm/uptex-fonts/jis/
	mkdir -p ${TEXMF}/fonts/vf/uptex-fonts/min
	cp ./vf/*10* ${TEXMF}/fonts/vf/uptex-fonts/min/
	mkdir -p ${TEXMF}/fonts/vf/uptex-fonts/jis
	cp ./vf/up* ${TEXMF}/fonts/vf/uptex-fonts/jis/

clean:
	rm -rf tfm vf
