#!/bin/bash

wsub -A lt1_starter-176 -l nodes=1:ppn=28:skylake\
        -batch addcol.pbs -data desfiles.txt\
 	-prolog prolog-addcol.sh -epilog epilog-addcol.sh

