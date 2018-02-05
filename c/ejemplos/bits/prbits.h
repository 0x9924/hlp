#include <stdio.h>
#include <limits.h>

#define BYTETOBINPATTERN "%d%d%d%d%d%d%d%d"
#define INTTOBINPATTERN "%d%d%d%d%d%d%d%d %d%d%d%d%d%d%d%d %d%d%d%d%d%d%d%d %d%d%d%d%d%d%d%d"

/*
  0x01, ..., 0x80 son simplemente las potencias de 2 en hexadecimal.
 */
#define BYTETOBIN(byte)  \
  (byte & 0x80 ? 1 : 0), \
  (byte & 0x40 ? 1 : 0), \
  (byte & 0x20 ? 1 : 0), \
  (byte & 0x10 ? 1 : 0), \
  (byte & 0x08 ? 1 : 0), \
  (byte & 0x04 ? 1 : 0), \
  (byte & 0x02 ? 1 : 0), \
  (byte & 0x01 ? 1 : 0)


#define INTBIN(byte)				\
    (byte & 0x80000000 ? 1 : 0),			\
	(byte & 0x40000000 ? 1 : 0),			\
	(byte & 0x20000000 ? 1 : 0),			\
	(byte & 0x10000000 ? 1 : 0),			\
	(byte & 0x08000000 ? 1 : 0),			\
	(byte & 0x04000000 ? 1 : 0),			\
	(byte & 0x02000000 ? 1 : 0),			\
	(byte & 0x01000000 ? 1 : 0),			\
	(byte & 0x800000 ? 1 : 0),				\
	(byte & 0x400000 ? 1 : 0),				\
	(byte & 0x200000 ? 1 : 0),				\
	(byte & 0x100000 ? 1 : 0),				\
	(byte & 0x080000 ? 1 : 0),				\
	(byte & 0x040000 ? 1 : 0),				\
	(byte & 0x020000 ? 1 : 0),				\
	(byte & 0x010000 ? 1 : 0),				\
	(byte & 0x8000 ? 1 : 0),				\
	(byte & 0x4000 ? 1 : 0),				\
	(byte & 0x2000 ? 1 : 0),				\
	(byte & 0x1000 ? 1 : 0),				\
	(byte & 0x0800 ? 1 : 0),				\
	(byte & 0x0400 ? 1 : 0),				\
	(byte & 0x0200 ? 1 : 0),				\
	(byte & 0x0100 ? 1 : 0),			\
	(byte & 0x80 ? 1 : 0),				\
	(byte & 0x40 ? 1 : 0),				\
	(byte & 0x20 ? 1 : 0),				\
	(byte & 0x10 ? 1 : 0),				\
	(byte & 0x08 ? 1 : 0),				\
	(byte & 0x04 ? 1 : 0),				\
	(byte & 0x02 ? 1 : 0),				\
	(byte & 0x01 ? 1 : 0)

#define PRBIN(x) printf("%"# x " es "BYTETOBINPATTERN"\n",	\
			x , BYTETOBIN(x))
#define prbits(x) printf(BYTETOBINPATTERN, BYTETOBIN(x))

#define prbitsINT(x) printf(INTTOBINPATTERN, INTBIN(x))

#define prbool(x) printf("%s", x ? " true " : " false ")
