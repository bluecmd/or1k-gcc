/* Test __atomic routines for existence and proper execution on 1 byte 
   values with each valid memory model.  */
/* { dg-do run } */
/* { dg-require-effective-target sync_char_short } */

/* Test the execution of the __atomic_compare_exchange_n builtin for a char.  */

extern void abort(void);

char v = 0;
char expected = 0;
char max = ~0;
char desired = ~0;
char zero = 0;

#define STRONG 0
#define WEAK 1

int
main ()
{

  printf("%d\n", __LINE__);
  if (!__atomic_compare_exchange_n (&v, &expected, max, STRONG , __ATOMIC_RELAXED, __ATOMIC_RELAXED)) 
    abort ();
  printf("%d\n", __LINE__);
  if (expected != 0)
    abort ();

  printf("%d\n", __LINE__);
  if (__atomic_compare_exchange_n (&v, &expected, 0, STRONG , __ATOMIC_ACQUIRE, __ATOMIC_RELAXED)) 
    abort ();
  printf("%d\n", __LINE__);
  if (expected != max)
    abort ();

  printf("%d\n", __LINE__);
  if (!__atomic_compare_exchange_n (&v, &expected, 0, STRONG , __ATOMIC_RELEASE, __ATOMIC_ACQUIRE)) 
    abort ();
  printf("%d\n", __LINE__);
  if (expected != max)
    abort ();
  printf("%d\n", __LINE__);
  if (v != 0)
    abort ();

  printf("%d\n", __LINE__);
  if (__atomic_compare_exchange_n (&v, &expected, desired, WEAK, __ATOMIC_ACQ_REL, __ATOMIC_ACQUIRE)) 
    abort ();
  printf("%d\n", __LINE__);
  if (expected != 0)
    abort ();

  printf("%d\n", __LINE__);
  if (!__atomic_compare_exchange_n (&v, &expected, desired, STRONG , __ATOMIC_SEQ_CST, __ATOMIC_SEQ_CST)) 
    abort ();
  printf("%d\n", __LINE__);
  if (expected != 0)
    abort ();
  printf("%d\n", __LINE__);
  if (v != max)
    abort ();

  /* Now test the generic version.  */

  v = 0;

  printf("%d\n", __LINE__);
  if (!__atomic_compare_exchange (&v, &expected, &max, STRONG, __ATOMIC_RELAXED, __ATOMIC_RELAXED))
    abort ();
  printf("%d\n", __LINE__);
  if (expected != 0)
    abort ();

  printf("%d\n", __LINE__);
  if (__atomic_compare_exchange (&v, &expected, &zero, STRONG , __ATOMIC_ACQUIRE, __ATOMIC_RELAXED)) 
    abort ();
  printf("%d\n", __LINE__);
  if (expected != max)
    abort ();

  printf("%d\n", __LINE__);
  if (!__atomic_compare_exchange (&v, &expected, &zero, STRONG , __ATOMIC_RELEASE, __ATOMIC_ACQUIRE)) 
    abort ();
  printf("%d\n", __LINE__);
  if (expected != max)
    abort ();
  printf("%d\n", __LINE__);
  if (v != 0)
    abort ();

  printf("%d\n", __LINE__);
  if (__atomic_compare_exchange (&v, &expected, &desired, WEAK, __ATOMIC_ACQ_REL, __ATOMIC_ACQUIRE)) 
    abort ();
  printf("%d\n", __LINE__);
  if (expected != 0)
    abort ();

  printf("%d\n", __LINE__);
  if (!__atomic_compare_exchange (&v, &expected, &desired, STRONG , __ATOMIC_SEQ_CST, __ATOMIC_SEQ_CST)) 
    abort ();
  printf("%d\n", __LINE__);
  if (expected != 0)
    abort ();
  printf("%d\n", __LINE__);
  if (v != max)
    abort ();

  return 0;
}
