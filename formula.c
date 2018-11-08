#include "formula.h"

int     main(int argc, char** argv)
{
        int     pow, i;
        struct timeval  begin, end;
        if ((argc != 2) || strcmp(argv[1], "-h") == 0 || (pow = atoi(argv[1])) < 0)
        {
                printf("Usage: formula <positive integer>\n");
                return  0;
        }
        gettimeofday(&begin, NULL);
        printf("(1 + x)^%d = 1 ", pow);
        for (i = 1; i <= pow; i ++)
        {
                printf("+ %d*x^%d ", nCr(pow, i), i);
        }
        printf("\n");
        gettimeofday(&end, NULL);
        printf("Time Required = %d microsecond\n", (end.tv_sec - begin.tv_sec) * 1000000 + (end.tv_usec - begin.tv_usec));

        return  0;
}

