CFLAGS			:= -I../lib
LDFLAGS			:= -L../lib
LDLIBS			:= -lmosquitto -lpthread
CROSS_COMPILE	:=
CC				:= gcc


.PHONY: all clean

all : mosquitto_pub mosquitto_sub

mosquitto_pub : pub_client.o client_shared.o
	cd ../lib && make
	${CROSS_COMPILE}${CC} $^ -o $@ ${LDFLAGS} ${LDLIBS}

mosquitto_sub : sub_client.o client_shared.o
	${CROSS_COMPILE}${CC} $^ -o $@ ${LDFLAGS} ${LDLIBS}


clean : 
	-rm -f *.o mosquitto_pub mosquitto_sub








#pub_client.o : pub_client.c 
#	${CROSS_COMPILE}${CC} -c $< -o $@ ${CFLAGS}
#sub_client.o : sub_client.c
#	${CROSS_COMPILE}${CC} -c $< -o $@ ${CFLAGS}
#client_shared.o : client_shared.c client_shared.h
#	${CROSS_COMPILE}${CC} -c $< -o $@ ${CFLAGS}
