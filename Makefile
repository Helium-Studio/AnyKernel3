# Zip Naming
KNAME ?= Zundamon-OSS
VERSION ?= 
CODENAME ?= 

ZIP := $(KNAME)-$(VERSION)-$(CODENAME)
EXCLUDE := Makefile *.git* *.jar* *.md*

# Zipping
zip: $(ZIP)
$(ZIP):
	@echo "Creating ZIP: $(ZIP)-signed.zip"
	@zip -r9 "$@.zip" . -q -x $(EXCLUDE)
	@echo "Signing ZIP with AOSP keys..."
	@java -jar *.jar* "$@.zip" "$@-signed.zip"
	@echo "Done!"

# Cleaning
clean:
	@rm -rf *dtb*
	@rm -rf *Image*
	@rm -rf *.zip*
