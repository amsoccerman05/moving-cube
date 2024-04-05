#include <math.h>
#include <stdio.h>
#include <string.h>
#include <unistd.h>

// make a moving cube using c
// compile with gcc spin.c -o spin -lm
// run with ./spin

// A, B, C are the angles of rotation
float A, B, C;

// cubeWidth is the width of the cube
float cubeWidth = 10;
int width = 160, height = 44;
float zBuffer[160 * 44];
char buffer[160 *44];
int backgroundASCIICode = ' ';
int distanceFromCam = 100;
float K1 = 40;

// incrementSpeed is the speed of the rotation
float incrementSpeed = 0.6;

// x, y, z are the coordinates of the cube
float x, y, z;
float ooz;
int xp, yp;
int idx;

// calculateX, calculateY, calculateZ are the functions to calculate the coordinates of the cube
float calculateX(int i, int j, int k) {
    return j * sin(A) * sin(B) * cos(C) - k * cos(A) * sin(B) * cos(C) + j * cos(A) * sin(C) + k * sin(A) + sin(C) + i * cos(B) * cos(C);
}

float calculateY(int i, int j, int k) {
    return j * cos(A) * cos(C) + k * sin(A) * cos(C) - j * sin(A) * sin(B) * sin(C) + k * cos(A) * sin(B) * sin(C) - i * cos(B) * sin(C);
}

float calculateZ(int i, int j, int k) {
    return k * cos(A) * cos(B) - j * sin(A) * cos(B) + i * sin(B);
}

void calculateForSurface(float cubeX, float cubeY, float cubeZ, int ch) { 
    x = calculateX(cubeX, cubeY, cubeZ);
    y = calculateY(cubeX, cubeY, cubeZ);
    z = calculateZ(cubeX, cubeY, cubeZ);
    ooz = 1/z;
    xp = (int)(width / 2 - 2 * cubeWidth + K1 * ooz * x * 2);
    yp = (int)(height / 2 + K1 * ooz * y);

    idx = xp + yp * width;
    if (idx >= 0 && idx < width * height) {
        if (ooz > zBuffer[idx]) {
            zBuffer[idx] = ooz;
            buffer[idx] = ch;
        }
    }
}

int main() {
    printf("\x1b[2J");
    while (1) {
    memset(buffer, backgroundASCIICode, width * height);
    memset(buffer, 0, width * height * 4);
    for (float cubeX = -cubeWidth; cubeX < cubeWidth; cubeX += incrementSpeed) {
        for (float cubeY = -cubeWidth; cubeY < cubeWidth; cubeY += incrementSpeed) {
            calculateForSurface(cubeX, cubeY, -cubeWidth, '.');
            calculateForSurface(cubeWidth, cubeY, cubeX, '$');
            calculateForSurface(-cubeWidth, cubeY, -cubeX, '~');
            calculateForSurface(-cubeX, cubeY, cubeWidth, '#');
            calculateForSurface(cubeX, -cubeWidth, -cubeY, ':');
            calculateForSurface(cubeX, cubeWidth, cubeY, '+');
        }
    }
    printf("A: %f, B: %f, C: %f\n", A, B, C);
    printf("\x1b[H");
    for (int k = 0; k < width * height; k++) {
        putchar(k % width ? buffer[k] : 10);
    }
    A += 0.005;
    B += 0.005;
    usleep(1000);

        A += 0.005;
        B += 0.005;
        usleep(1000);
    }
    return 0;
}
