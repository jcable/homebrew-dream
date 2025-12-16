/* Helper functions for gettimeofday on Windows */
#ifndef __HELPER_H__
#define __HELPER_H__
#include <time.h>
struct timezone 
{
  int  tz_minuteswest; /* minutes W of Greenwich */
  int  tz_dsttime;     /* type of dst correction */
};

int gettimeofday(struct timeval *tv, struct timezone *tz);
#endif