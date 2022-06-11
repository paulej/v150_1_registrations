#
# Makefile to build Internet Drafts from markdown using mmarc and
# relying on the docker image "paulej/rfctools".
#

.PHONY: all clean

DRAFT    = draft-jones-v150-registration
VERSION  = $(shell grep 'value.*=.*"$(DRAFT)-[0-9]\+"' $(DRAFT).md | head -1 | sed 's/.*"$(DRAFT)-\([0-9]\+\)".*/\1/')
DOCKER   = docker run --rm --user=$(UID):$(GID) -v $(CWD):/rfc \
		      -v $(HOME)/.cache/xml2rfc:/var/cache/xml2rfc \
		      paulej/rfctools
MMARK	= $(DOCKER) mmark
XML2RFC	= $(DOCKER) xml2rfc

SRC  := $(DRAFT).md)
XML  := $(patsubst %.md,%.xml,$(SRC))
UID  := $(shell id -u)
GID  := $(shell id -g)
CWD  := $(shell pwd)

# Ensure the xml2rfc cache directory exists locally
IGNORE := $(shell mkdir -p $(HOME)/.cache/xml2rfc)

all: xml txt pdf html

xml: $(DRAFT)-$(VERSION).xml

txt: $(DRAFT)-$(VERSION).txt

pdf: $(DRAFT)-$(VERSION).pdf

html: $(DRAFT)-$(VERSION).html

clean:
	rm -f $(DRAFT)-$(VERSION).xml $(DRAFT)-$(VERSION).txt \
	      $(DRAFT)-$(VERSION).pdf $(DRAFT)-$(VERSION).html

%.xml: $(DRAFT).md
	$(MMARK) $(DRAFT).md >$@

%.txt: $(DRAFT)-$(VERSION).xml
	$(XML2RFC) --v3 --text "$^" -o "$@"

%.pdf: $(DRAFT)-$(VERSION).xml
	$(XML2RFC) --v3 --pdf "$^" -o "$@"

%.html: $(DRAFT)-$(VERSION).xml
	$(XML2RFC) --v3 --html "$^" -o "$@"

