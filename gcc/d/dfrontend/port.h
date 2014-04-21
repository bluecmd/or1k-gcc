
// Copyright (c) 1999-2012 by Digital Mars
// All Rights Reserved
// written by Walter Bright
// http://www.digitalmars.com

#ifndef PORT_H
#define PORT_H

// Portable wrapper around compiler/system specific things.
// The idea is to minimize #ifdef's in the app code.

#include <stdint.h>

#include "longdouble.h"

// Be careful not to care about sign when using dinteger_t
//typedef uint64_t integer_t;
typedef uint64_t dinteger_t;    // use this instead of integer_t to
                                // avoid conflicts with system #include's

// Signed and unsigned variants
typedef int64_t sinteger_t;
typedef uint64_t uinteger_t;

typedef int8_t                  d_int8;
typedef uint8_t                 d_uns8;
typedef int16_t                 d_int16;
typedef uint16_t                d_uns16;
typedef int32_t                 d_int32;
typedef uint32_t                d_uns32;
typedef int64_t                 d_int64;
typedef uint64_t                d_uns64;

typedef float                   d_float32;
typedef double                  d_float64;
typedef longdouble              d_float80;

typedef d_uns8                  d_char;
typedef d_uns16                 d_wchar;
typedef d_uns32                 d_dchar;

#if _MSC_VER
typedef __int64 longlong;
typedef unsigned __int64 ulonglong;
#else
typedef long long longlong;
typedef unsigned long long ulonglong;
#endif

struct Port
{
    static longdouble nan;
    static longdouble snan;
    static longdouble infinity;

    static void init();

    static int isNan(longdouble);
    static int isSignallingNan(longdouble);
    static int isInfinity(longdouble);

    static longdouble fmodl(longdouble x, longdouble y);

    static char *strupr(char *);

    static int memicmp(const char *s1, const char *s2, int n);
    static int stricmp(const char *s1, const char *s2);
};

#endif
