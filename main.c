#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>

void input(char* str) {
    int capacity = 1000000;
    int size = -1;
    do {
        ++size;
        str[size] = getchar();
        if (size + 1 == capacity) {
            capacity *= 2;
            str = realloc(str, capacity);
        }
    } while (str[size] != EOF);
    str[size] = '\0';
}

void make_new_string(char* str) {
    for (int i = 0; i < strlen(str); ++i) {
        if (str[i] == 'a' || str[i] == 'e' || str[i] == 'i' || str[i] == 'o' || str[i] == 'u' || str[i] == 'y') {
            str[i] -= 32;
        }
    }
}

void output(char* str) {
    for (int i = 0; i < strlen(str); ++i) {
        putchar(str[i]);
    }
}

char* random_way(char* str) {
    srand(time(NULL));

    int capacity = 1000000;
    int n = (rand() % 100000) + 90000;
    for (int i = 0; i < n; ++i) {
        if (i + 1 == capacity) {
            capacity *= 2;
            str = realloc(str, capacity);
        }
        str[i] = 32 + (rand() % 96);
    }
    str[n] = '\0';
    return str;
}

int main(int argc, char** argv) {
    if (argc == 3 && strcmp(argv[1], "-random") == 0 && freopen(argv[2], "w", stdout) != NULL) {
        char* str = malloc(1000000);
        str = random_way(str);

        clock_t t0 = clock();
        make_new_string(str);

        output(str);
        printf("\n\n%lf\n", (double) (clock() - t0) / CLOCKS_PER_SEC);

        fclose(stdout);
        free(str);
    } else if (argc == 3 && freopen(argv[1], "r", stdin) != NULL &&
        freopen(argv[2], "w", stdout) != NULL) {
        char* str = malloc(1000000);
        input(str);

        clock_t t0 = clock();
        make_new_string(str);

        output(str);
        printf("%lf\n", (double) (clock() - t0) / CLOCKS_PER_SEC);

        fclose(stdin);
        fclose(stdout);
        free(str);
    } else {
        printf("Incorrect input\n");
    }

    return 0;
}
