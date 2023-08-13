# Build process

## build

build the jar (bldjar)

build core lib (bldlib)
  - repro    : vsam file utility
  - superzap : general file utility 
  - unref    : show unref symbols
  - cvttohex : bin to hex 
  - iefbr14  : return 0
  - dat      : date and time subroutines
  - remove all other items

build zcobol lib (bldcoblib)
  - cvttohex : bin to hex (dup..)

create dist dir
--z390.jar
--bin
  |---(bash/*)
  |---(bat/*)
--loadlib
  |---(linklib/*.390)
--objlib
  |---(linklib/*.obj)
--maclib
  |---*.MAC

zip dist dir

artifact - zip

## test win
depends on: build
Install package
Run test framework -> point to repo

## test linux
depends on: build
Installs package
Run test framework -> point to repo

