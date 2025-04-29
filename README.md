# WRDL/400
 Everyone's favourite 5-letter word game, now on AS/400

 Licensed under the Pirate License, see LICENSE.TXT for more details

Source Layout:

* QDDSSRC: 	This library contains the data description spec for the voting database, guestbook database, LEARN/400 strings, and misc settings
* QSDASRC:	This library contains the DDS for all RPG screen descriptions
* QRPGLESRC:	This library contains the RPG IV/ILE source code for all applications




# To Compile
WRDL/400 has been updated to support OS/400 V3R1! (And V3R6 on POWER)
OS/400 V2 and V1 have not been tested because we simply don't have any working machines or install images for those versions.

Compile the DDS, compile the screen spec, then compile the RPGLE file.


# Adding Words to Database
You can either STRDFU to add words one-by-one, or you can upload the included WRDL.CSV to your IFS and import it to WRDLWORDS.