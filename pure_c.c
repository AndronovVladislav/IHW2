#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>

void input(char* str, FILE* stream) {
    int capacity = 1000000;
    int size = -1;
    do {
        ++size;
        str[size] = fgetc(stream);
        if (size + 1 == capacity) {
            capacity *= 2;
            str = realloc(str, capacity);
        }
    } while (str[size] != EOF);
    str[size] = '\0';
}

void make_new_string(char* str) {
    for (int i = 0; i < strlen(str); ++i) {
        if (str[i] == 'a' || str[i] == 'e' || str[i] == 'i' ||
            str[i] == 'o' || str[i] == 'u' || str[i] == 'y') {
            str[i] -= 32;
        }
    }
}

void output(char* str, FILE* stream) {
    for (int i = 0; i < strlen(str); ++i) {
        fputc(str[i], stream);
    }
}

char* random_way(char* str) {
    srand(time(NULL));

    int capacity = 1000000;
    int n = (rand() % 100000) + 300000;
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
    char* str = malloc(1000000);
    if (argc == 3) {
        FILE *file_in = fopen(argv[1], "r");
        FILE *file_out = fopen(argv[2], "w");
        if (strcmp(argv[1], "-random") == 0 && (file_out != NULL)) {
            str = random_way(str);

            clock_t t0 = clock();
            make_new_string(str);

            output(str, file_out);
            printf("%lf\n", (double) (clock() - t0) / CLOCKS_PER_SEC);
        } else if (file_in != NULL && file_out != NULL) {
            input(str, file_in);
            fclose(file_in);
            make_new_string(str);
        }
        fclose(file_out);
    } else {
        printf("Incorrect input\n");
    }

    free(str);
    return 0;
}
