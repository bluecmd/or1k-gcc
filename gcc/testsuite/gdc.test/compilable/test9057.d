// PERMUTE_ARGS:
// REQUIRED_ARGS: -c -Icompilable/extra-files
// EXTRA_SOURCES: extra-files/imp9057.d extra-files/imp9057_2.d

struct Bug9057(T)
{
    T x;
}

void test9507() {
    import imp9057;
    Bug9057!(BugInt) xxx;
}

void test9507_2() {
    import imp9057_2;
    Bug9057!(BugInt) xxx;
}


