#ifndef UTIL_H
#define UTIL_H

#include <time.h>

time_t timegm(struct tm* const);

struct timezone 
{
  int  tz_minuteswest; /* minutes W of Greenwich */
  int  tz_dsttime;     /* type of dst correction */
};

int gettimeofday(struct timeval *tv, struct timezone *tz);

#endif // UTIL_H
