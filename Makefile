# tf/cfg/Makefile
#-------------------------------------------------------------------------------

.SUFFIXES:

CONFIG :=	user/bad-dad-keybinds.cfg
CONFIG2 :=	user/tf2-monitor-fkeys.cfg
MOTD := 	motd.txt

#-------------------------------------------------------------------------------

all install: $(MOTD)
clean distclean uninstall debug: ;

#-------------------------------------------------------------------------------

_this_makefile	:= $(lastword $(MAKEFILE_LIST))

$(MOTD):	$(_this_makefile) $(CONFIG)
		{	[ "$$PROLOG" ] && echo "$$PROLOG"; \
			/bin/grep -h ^bind $(CONFIG) | cut -c-74; \
			/bin/grep -h '^bind "[^KF]' $(CONFIG2) | cut -c-74; \
			[ "$$EPILOG" ] && echo "$$EPILOG"; \
			echo; \
			echo This file was created by $(_this_makefile) on `date`; \
		} >$@

#-------------------------------------------------------------------------------

define PROLOG
Bad Dad's local binds:

endef
export PROLOG

#-------------------------------------------------------------------------------

define EPILOG
endef
export EPILOG

#----------------------------------------------------------------------------eof
