UPLATEX = uplatex
UPTEX = euptex
DVIPDFMX = dvipdfmx

####
####

all: ajp_up ajp_jo svsls

ajp_up.dvi: ajp_up.tex
	$(UPLATEX) ajp_up.tex

ajp_up: ajp_up.dvi
	for opt in u00 u04 a00 a04; do \
		$(DVIPDFMX) -f ajp-$$opt.map -o ajp_up-$$opt.pdf ajp_up.dvi ;\
	done

ajp_jo.dvi: ajp_jo.tex
	$(UPLATEX) ajp_jo.tex

ajp_jo: ajp_jo.dvi
	for opt in u00 u04 a00 a04; do \
		$(DVIPDFMX) -f ajp-$$opt.map -o ajp_jo-$$opt.pdf ajp_jo.dvi ;\
	done

svsls: svsls_dvi svsls_pdf
svsls_dvi:
	for lang in jpn sch tch kor; do \
		$(UPTEX) svsls-$$lang-h.tex ;\
		$(UPTEX) svsls-$$lang-v.tex ;\
	done

svsls_pdf:
	for lang in jpn sch tch kor; do \
		$(DVIPDFMX) -f hara.map    svsls-$$lang-h.dvi ;\
		$(DVIPDFMX) -f hara.map -l svsls-$$lang-v.dvi ;\
	done

clean:
	rm -f *.aux *.log *.dvi *.ps *.pdf
