#include<stdio.h>

float fquadratfunktion(float a) {
    return a * a;
}

int iquadratfunktion(int a) {
    return a * a;
}

int main()
{
    printf("Hello World %f, wobei wir auch anerkennen müssen: %i\n", fquadratfunktion(2.0),iquadratfunktion(2));
    return 0;
}