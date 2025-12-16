
#include "platform_util.h"

#include <windows.h>

time_t timegm(struct tm *tm)
{
    SYSTEMTIME st;
    st.wYear = tm->tm_year+1900;
    st.wMonth = tm->tm_mon+1;
    st.wDay = tm->tm_mday;
    st.wHour = 0;
    st.wMinute = 0;
    st.wSecond = 0;
    st.wMilliseconds = 0;
    FILETIME ft;
    SystemTimeToFileTime(&st, &ft);
    ULARGE_INTEGER uli;
    uli.LowPart = ft.dwLowDateTime;
    uli.HighPart = ft.dwHighDateTime;
    return (time_t)(uli.QuadPart/10000000 - 11644473600);
}

/* 
 * Author: Ugo Varetto - ugovaretto@gmail.com
 * This code is distributed under the terms of the Apache Software License version 2.0
 * https://opensource.org/licenses/Apache-2.0
*/

#if defined(_MSC_VER) || defined(_MSC_EXTENSIONS)
  #define DELTA_EPOCH_IN_MICROSECS  11644473600000000Ui64
#else
  #define DELTA_EPOCH_IN_MICROSECS  11644473600000000ULL
#endif

int gettimeofday(struct timeval *tv, struct timezone *tz)
{
  FILETIME ft;
  unsigned __int64 tmpres = 0;
  static int tzflag = 0;

  if (NULL != tv)
  {
    GetSystemTimeAsFileTime(&ft);

    tmpres |= ft.dwHighDateTime;
    tmpres <<= 32;
    tmpres |= ft.dwLowDateTime;

    tmpres /= 10;  /*convert into microseconds*/
    /*converting file time to unix epoch*/
    tmpres -= DELTA_EPOCH_IN_MICROSECS; 
    tv->tv_sec = (long)(tmpres / 1000000UL);
    tv->tv_usec = (long)(tmpres % 1000000UL);
  }

  if (NULL != tz)
  {
    if (!tzflag)
    {
      _tzset();
      tzflag++;
    }
    tz->tz_minuteswest = _timezone / 60;
    tz->tz_dsttime = _daylight;
  }

  return 0;
}

// Source - https://stackoverflow.com/a/23616164
// Posted by Bill Weinman, modified by community. See post 'Timeline' for change history
// Retrieved 2025-12-16, License - CC BY-SA 3.0

int setenv(const char *name, const char *value, int overwrite)
{
    int errcode = 0;
    if(!overwrite) {
        size_t envsize = 0;
        errcode = getenv_s(&envsize, NULL, 0, name);
        if(errcode || envsize) return errcode;
    }
    return _putenv_s(name, value);
}

int unsetenv(const char *name)
{
    return SetEnvironmentVariable(TEXT(name), NULL);
}

