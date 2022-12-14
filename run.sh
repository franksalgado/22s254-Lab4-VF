#!/usr/bin/env bash
set -e
rm -f -- *.o *.lis *.out

glob() {
    # https://stackoverflow.com/a/15515152/5041327
    [ -e "$1" ] && echo "$@"
}

CFLAGS+="-g -m64 -fsanitize=address -fstack-protector -fno-pie -no-pie "
CXXFLAGS+="$CFLAGS "
CXXFLAGS+="-std=c++17 "

for f in $(glob *.cpp); do
    g++ -c -Wall $CXXFLAGS -o "$f.o" "$f"
done

g++ $CXXFLAGS -o "$(basename "$PWD").out" ./*.o

./"$(basename "$PWD").out"

rm -f -- *.o *.lis *.out