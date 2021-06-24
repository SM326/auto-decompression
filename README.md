# auto-decompression
An automatic decompression software which makes use of gzip, bzip2, and tar.

Given a file name as input, this program will determine if the file is able to be decompressed using one of three methods (gzip, bzip2, or tar). 
If eligible, the file will be decompressed using the correct method until it cannot be decompressed by any of the three methods. 
The output file will always be named 'final' and its location will be given upon completion of the program.

Installation:
  
  
	1a. Use git to install the program, then use 'chmod a+x Decom.sh' in order to make the file executable
  
	1b. Copy the code into a blank file, then use 'chmod a+x <filename>' in order to make the file executable
  
	2. Run the program using the command 'bash Decom.sh' or 'bash <filename>' while in the same directory as the file

Comments/suggestions are welcome!

See 'auto-decompression/LICENSE' for licensing information.
