WITH_THREADING:=yes
WITH_PERSISTENCE:=yes
WITH_SYS_TREE:=yes
#WITH_SRV:=yes


# =============================================================================
# End of user configuration
# =============================================================================
VERSION=1.4.10
#TIMESTAMP:=$(shell date "+%F %T%z")
# Client library SO version. Bump if incompatible API/ABI changes are made.
SOVERSION=1


UNAME:=$(shell uname -s)
#CFLAGS?=-Wall -ggdb -O2
LIB_CFLAGS:=${CFLAGS} ${CPPFLAGS} -I. -I.. -I../lib
LIB_CXXFLAGS:=$(LIB_CFLAGS) ${CPPFLAGS}
LIB_LDFLAGS:=${LDFLAGS}
BROKER_CFLAGS:=${LIB_CFLAGS} ${CPPFLAGS} -DVERSION="\"${VERSION}\"" -DTIMESTAMP="\"${TIMESTAMP}\"" -DWITH_BROKER
CLIENT_CFLAGS:=${CFLAGS} ${CPPFLAGS} -I../lib -DVERSION="\"${VERSION}\""
BROKER_LIBS:=-ldl -lm
LIB_LIBS:=
PASSWD_LIBS:=

ifeq ($(UNAME),Linux)
	BROKER_LIBS:=$(BROKER_LIBS) -lrt -Wl,--dynamic-list=linker.syms
	LIB_LIBS:=$(LIB_LIBS) -lrt
endif

CLIENT_LDFLAGS:=$(LDFLAGS) -L../lib 


ifeq ($(WITH_THREADING),yes)
	LIB_LIBS:=$(LIB_LIBS) -lpthread
	LIB_CFLAGS:=$(LIB_CFLAGS) -DWITH_THREADING
endif


ifeq ($(WITH_PERSISTENCE),yes)
	BROKER_CFLAGS:=$(BROKER_CFLAGS) -DWITH_PERSISTENCE
endif


ifeq ($(WITH_SYS_TREE),yes)
	BROKER_CFLAGS:=$(BROKER_CFLAGS) -DWITH_SYS_TREE
endif

ifeq ($(WITH_SRV),yes)
	LIB_CFLAGS:=$(LIB_CFLAGS) -DWITH_SRV
	LIB_LIBS:=$(LIB_LIBS) -lcares
	CLIENT_CFLAGS:=$(CLIENT_CFLAGS) -DWITH_SRV
endif

MAKE_ALL:=mosquitto
