#include<stdio.h>
#define CMDM_LEN 128
#define MARGS 32

parse(b,cmd)
        char * b,cmd[MARGS][CMDM_LEN];
{       int N,i;
        for (N=0,i=0;*b&&N<MARGS&&i<CMDM_LEN;cmd[N++][i]=0,++b,i=0)
                if(*b=='"')for(++b;*b!='"'&&*b;++b,++i)
                  cmd[N][i]=(*b=='\\')?((*(++b)=='n')?'\n':*b):*b;
                else for(;*b&&*b!=' ';cmd[N][i++]=*(b++));
        return N;
}

main()
{
        char cmd[MARGS][CMDM_LEN];
        int argc=parse("./test -s \"real path\"",&cmd);
        printf("ARGC=%d\n",argc);
        int i;
        for (i=0;i<argc;++i)
        {
                printf("%s\n",cmd[i]);
        }        
}