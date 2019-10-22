// Licensed under the terms of the GNU GPL v3, or any later version.
//
// Copyright 2019 Nolan Leake <nolan@sigbus.net>
//
// Loosely based on bandwidth2 (originally by Guillaume Coré <fridim@onfi.re>)

#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <string.h>
#include <unistd.h>
#include <getopt.h>

typedef unsigned long long int ulli;

char* ltrim(char *str, const char *seps)
{
    size_t totrim;
    if (seps == NULL) {
        seps = "\t\n\v\f\r ";
    }
    totrim = strspn(str, seps);
    if (totrim > 0) {
        size_t len = strlen(str);
        if (totrim == len) {
            str[0] = '\0';
        }
        else {
            memmove(str, str + totrim, len + 1 - totrim);
        }
    }
    return str;
}


void display(double used, int const decimals)
{
    char* string;
    if(0 > asprintf(&string, "%*.*lf%%\n", decimals + 3 + 1, decimals, used)) return;
    ltrim(string, " ");
    printf("%s", string);
    free(string);
}

ulli get_usage(ulli *used_jiffies)
{
    FILE *fd = fopen("/proc/stat", "r");
    ulli user, nice, sys, idle, iowait, irq, sirq, steal, guest, nguest;

    if (!fd) {
        perror("Couldn't open /proc/stat\n");
        exit(EXIT_FAILURE);
    }

    // get all types of cpu usage from /proc/stat
    if (fscanf(fd, "cpu  %llu %llu %llu %llu %llu %llu %llu %llu %llu %llu",
                &user, &nice, &sys, &idle, &iowait, &irq, &sirq,
                &steal, &guest, &nguest) != 10) {
        perror("Couldn't read jiffies from /proc/stat\n");
        exit(EXIT_FAILURE);
    }
    fclose(fd);

    // All above variables except 'idle' & 'iowait' are cpu usage
    // Store used in *used_jiffies & return total. So usage % = used_jiffies/total 
    *used_jiffies = user + nice + sys + irq + sirq + steal + guest + nguest;
    ulli total = *used_jiffies + idle + iowait;
    return total;
}

int main()
{
    int t = 1, decimals = 1;
    char *envvar = NULL;

    envvar = getenv("REFRESH_TIME");
    if (envvar)
        t = atoi(envvar);
    envvar = getenv("DECIMALS");
    if (envvar)
        decimals = atoi(envvar);

    ulli old_total;
    ulli old_used;

    old_total = get_usage(&old_used);

    while (1) {
        ulli used;
        ulli total;

        total = get_usage(&used);

        display(100.0D * (used - old_used) / (total - old_total), decimals);
        fflush(stdout);
        old_total = total;
        old_used = used;
        sleep(t);
    }

    return EXIT_SUCCESS;
}
