// build with: clang spin.c -o spin -lm
// run with:   ./spin
// make sure your terminal is at least 80x24 and using a monospace font

#include <math.h>
#include <stdio.h>
#include <string.h>
#include <unistd.h>

static float A = 0.f, B = 0.f, C = 0.f;

static const float cubeWidth = 10.f;
static const int width = 80, height = 24;

static float zBuffer[80 * 24];
static char  buffer [80 * 24];

static const int backgroundASCIICode = ' ';
static const float K1 = 40.f;
static const float incrementSpeed = 0.6f;

static float x, y, z, ooz;
static int xp, yp, idx;

// figure out where each corner of the cube moves when rotated
static inline float calculateX(float i, float j, float k) {
    return j * sinf(A) * sinf(B) * cosf(C) - k * cosf(A) * sinf(B) * cosf(C)
         + j * cosf(A) * sinf(C) + k * sinf(A) + i * cosf(B) * cosf(C);
}
static inline float calculateY(float i, float j, float k) {
    return j * cosf(A) * cosf(C) + k * sinf(A) * cosf(C)
         - j * sinf(A) * sinf(B) * sinf(C) + k * cosf(A) * sinf(B) * sinf(C)
         - i * cosf(B) * sinf(C);
}
static inline float calculateZ(float i, float j, float k) {
    return k * cosf(A) * cosf(B) - j * sinf(A) * cosf(B) + i * sinf(B);
}

// plot a point on the cube using ascii
static inline void plotSurface(float cx, float cy, float cz, char ch) {
    x = calculateX(cx, cy, cz);
    y = calculateY(cx, cy, cz);
    z = calculateZ(cx, cy, cz) + 100.f;  // move it away from the camera
    if (z <= 1e-3f) return;

    ooz = 1.f / z;
    xp = (int)(width  / 2 + K1 * ooz * x * 2.f);
    yp = (int)(height / 2 + K1 * ooz * y);

    if (xp < 0 || xp >= width || yp < 0 || yp >= height) return;
    idx = xp + yp * width;
    if (ooz > zBuffer[idx]) {
        zBuffer[idx] = ooz;
        buffer[idx] = ch;
    }
}

int main(void) {
    printf("\x1b[2J"); // clear screen once

    while (1) {
        // reset frame buffers
        for (int i = 0; i < width * height; ++i) {
            zBuffer[i] = 0.f;
            buffer[i]  = backgroundASCIICode;
        }

        // draw all faces of the cube
        for (float cx = -cubeWidth; cx <= cubeWidth; cx += incrementSpeed) {
            for (float cy = -cubeWidth; cy <= cubeWidth; cy += incrementSpeed) {
                plotSurface(cx,  cy, -cubeWidth, '.');  // front
                plotSurface(cubeWidth, cy,  cx,       '$'); // right
                plotSurface(-cubeWidth, cy, -cx,      '~'); // left
                plotSurface(-cx,  cy,  cubeWidth,     '#'); // back
                plotSurface(cx, -cubeWidth, -cy,       ':'); // bottom
                plotSurface(cx,  cubeWidth,  cy,       '+'); // top
            }
        }

        // draw frame
        printf("\x1b[H"); // move cursor home
        for (int k = 0; k < width * height; k++)
            putchar((k % width) ? buffer[k] : '\n');

        // rotate a bit
        A += 0.005f;
        B += 0.005f;
        C += 0.003f;
        usleep(10000); // ~10ms per frame
    }
    return 0;
}
