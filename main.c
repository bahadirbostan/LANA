#include <stdio.h>

extern int yyparse();

int main() {
    printf("Lana derleyici basladi.\n");
    int result = yyparse();
    if (result == 0) {
        printf("Parsing basariyla tamamlandi!\n");
    } else {
        printf("Parsing hatasi.\n");
    }
    return result;
}
