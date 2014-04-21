// backtrace.h - Fallback backtrace implementation. default implementation.

/* Copyright (C) 2005, 2006  Free Software Foundation

   This file is part of libgcj.

This software is copyrighted work licensed under the terms of the
Libgcj License.  Please consult the file "LIBGCJ_LICENSE" for
details.  */

#ifndef __SYSDEP_BACKTRACE_H__
#define __SYSDEP_BACKTRACE_H__

#include <java-stack.h>

#ifdef SJLJ_EXCEPTIONS

#undef _Unwind_GetIPInfo
#define _Unwind_GetIPInfo(ctx,ip_before_insn) \
  (abort (), (void) (ctx), *ip_before_insn = 1, 0)

#undef _Unwind_GetRegionStart
#define _Unwind_GetRegionStart(ctx) \
  (abort (), (void) (ctx), 0)

#undef _Unwind_Backtrace
#define _Unwind_Backtrace(trace_fn,state_ptr) \
  (fallback_backtrace (trace_fn, state_ptr))

/* Unwind through the call stack calling TRACE_FN with STATE for every stack
   frame.  Returns the reason why the unwinding was stopped.  */
_Unwind_Reason_Code
fallback_backtrace (_Unwind_Trace_Fn, _Jv_UnwindState *)
{
  return _URC_NO_REASON;
}

#endif /* SJLJ_EXCEPTIONS */

#endif
