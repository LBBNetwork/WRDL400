# WRDL/400
 Everyone's favourite 5-letter word game, now on AS/400

 Licensed under the Pirate License, see LICENSE.TXT for more details

Source Layout:

* QDDSSRC: 	This library contains the data description spec for the voting database, guestbook database, LEARN/400 strings, and misc settings
* QSDASRC:	This library contains the DDS for all RPG screen descriptions
* QRPGLESRC:	This library contains the RPG IV/ILE source code for all applications




# To Compile
This should run on versions of OS/400 as old as V3R7. I have not yet tested though.

Compile the DDS, compile the screen spec, then compile the RPGLE file.


# Adding Words to Database
You can either STRDFU to add words one-by-one, or you can upload the included WRDL.CSV to your IFS and import it to WRDLWORDS.