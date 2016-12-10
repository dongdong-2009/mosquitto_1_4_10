CROSS_COMPILE		:=
CC					:= gcc
LIB_CFLAGS			:= -I. -DWITH_THREADING

.PHONY : clean 

MOSQ_OBJS=mosquitto.o \
		  logging_mosq.o \
		  memory_mosq.o \
		  messages_mosq.o \
		  net_mosq.o \
		  read_handle.o \
		  read_handle_client.o \
		  read_handle_shared.o \
		  send_mosq.o \
		  send_client_mosq.o \
		  socks_mosq.o \
		  srv_mosq.o \
		  thread_mosq.o \
		  time_mosq.o \
		  tls_mosq.o \
		  util_mosq.o \
		  will_mosq.o

all : libmosquitto.a


clean :
	-rm -f *.o libmosquitto.a


libmosquitto.a : ${MOSQ_OBJS}
	${CROSS_COMPILE}$(AR) cr $@ $^

mosquitto.o : mosquitto.c mosquitto.h
	${CROSS_COMPILE}$(CC) $(LIB_CFLAGS) -c $< -o $@

logging_mosq.o : logging_mosq.c logging_mosq.h
	${CROSS_COMPILE}$(CC) $(LIB_CFLAGS) -c $< -o $@

messages_mosq.o : messages_mosq.c messages_mosq.h
	${CROSS_COMPILE}$(CC) $(LIB_CFLAGS) -c $< -o $@

memory_mosq.o : memory_mosq.c memory_mosq.h
	${CROSS_COMPILE}$(CC) $(LIB_CFLAGS) -c $< -o $@

net_mosq.o : net_mosq.c net_mosq.h
	${CROSS_COMPILE}$(CC) $(LIB_CFLAGS) -c $< -o $@

read_handle.o : read_handle.c read_handle.h
	${CROSS_COMPILE}$(CC) $(LIB_CFLAGS) -c $< -o $@

read_handle_client.o : read_handle_client.c read_handle.h
	${CROSS_COMPILE}$(CC) $(LIB_CFLAGS) -c $< -o $@

read_handle_shared.o : read_handle_shared.c read_handle.h
	${CROSS_COMPILE}$(CC) $(LIB_CFLAGS) -c $< -o $@

send_mosq.o : send_mosq.c send_mosq.h
	${CROSS_COMPILE}$(CC) $(LIB_CFLAGS) -c $< -o $@

send_client_mosq.o : send_client_mosq.c send_mosq.h
	${CROSS_COMPILE}$(CC) $(LIB_CFLAGS) -c $< -o $@

socks_mosq.o : socks_mosq.c
	${CROSS_COMPILE}$(CC) $(LIB_CFLAGS) -c $< -o $@

srv_mosq.o : srv_mosq.c
	${CROSS_COMPILE}$(CC) $(LIB_CFLAGS) -c $< -o $@

thread_mosq.o : thread_mosq.c
	${CROSS_COMPILE}$(CC) $(LIB_CFLAGS) -c $< -o $@

time_mosq.o : time_mosq.c
	${CROSS_COMPILE}$(CC) $(LIB_CFLAGS) -c $< -o $@

tls_mosq.o : tls_mosq.c
	${CROSS_COMPILE}$(CC) $(LIB_CFLAGS) -c $< -o $@

util_mosq.o : util_mosq.c util_mosq.h
	${CROSS_COMPILE}$(CC) $(LIB_CFLAGS) -c $< -o $@

will_mosq.o : will_mosq.c will_mosq.h
	${CROSS_COMPILE}$(CC) $(LIB_CFLAGS) -c $< -o $@

