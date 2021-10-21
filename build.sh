#!/usr/bin/env bash

mkdir -p build
cd build

cmake .. -DCMAKE_INSTALL_PREFIX=$PREFIX -DCMAKE_Fortran_COMPILER=$FC -DCMAKE_Fortran_FLAGS="${FFLAGS}"

make VERBOSE=1
make install

mkdir -p $PREFIX/share/pac99
cp $RECIPE_DIR/share/new.groups $PREFIX/share/pac99/.
