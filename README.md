# lazer-beam
haskell knockoff of https://viewsourcecode.org/snaptoken/kilo/03.rawInputAndOutput.html

references
https://hackage.haskell.org/package/base-4.11.0.0/docs/System-Posix-Types.html
https://hackage.haskell.org/package/unix-2.7.2.2/docs/System-Posix-Files.html
https://hackage.haskell.org/package/base-4.14.1.0/docs/System-IO.html
https://hackage.haskell.org/package/base-4.14.1.0/docs/Data-Char.html
http://hackage.haskell.org/package/base-4.7.0.1/docs/System-IO.html
https://hackage.haskell.org/package/unix-2.7.2.2/docs/System-Posix-IO.html

obvious problems

not catching failed system call exceptions
the code is real ugly. terrible names, lots of nested do - at some point tighten those up - the tX vars are ripe for mapM

no idea how to set CS8 - my term seems to use 8 bit chars. hope that'll keep working. :lolsob:
