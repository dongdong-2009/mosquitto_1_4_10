WITH_THREADING:=yes
#WITH_PERSISTENCE:=yes
#WITH_SRV:=yes
#WITH_UUID:=yes


#VERSION=1.4.10
TIMESTAMP:=$(shell date "+%F %T%z")

# Client library SO version. Bump if incompatible API/ABI changes are made.
SOVERSION=1


UNAME:=$(shell uname -s)
#CFLAGS?=-Wall -ggdb -O2

LIB_CFLAGS:=${CFLAGS} -I. -I.. -I../lib
LIB_LDFLAGS:=${LDFLAGS}
CLIENT_CFLAGS:=${CFLAGS} -I../lib #-DVERSION="\"${VERSION}\""

ifeq ($(UNAME),Linux)
	LIB_LIBS:=$(LIB_LIBS) -lrt
endif

CLIENT_LDFLAGS:=$(LDFLAGS) -L../lib 

LIB_CFLAGS:=$(LIB_CFLAGS) -fPIC
LIB_CXXFLAGS:=$(LIB_CXXFLAGS) -fPIC


ifeq ($(WITH_THREADING),yes)
	LIB_LIBS:=$(LIB_LIBS) -lpthread
	LIB_CFLAGS:=$(LIB_CFLAGS) -DWITH_THREADING
endif


ifeq ($(WITH_PERSISTENCE),yes)
	BROKER_CFLAGS:=$(BROKER_CFLAGS) -DWITH_PERSISTENCE
endif


ifeq ($(WITH_SRV),yes)
	LIB_CFLAGS:=$(LIB_CFLAGS) -DWITH_SRV
	LIB_LIBS:=$(LIB_LIBS) -lcares
	CLIENT_CFLAGS:=$(CLIENT_CFLAGS) -DWITH_SRV
endif
