#gets the module sys and gets the function argv
from sys import argv

#creates two variables and sets it to argv
script, filename = argv

#opens the filename and sets it as variable, txt

#Creates a file object, but is not the content itself.
#A file is like an old tape or even like a DVD player. You can move around inside them,
#and even "read" them, but the DVD player is not the DVD; in the same way the file object
#is not the file's contents.
txt = open(filename)

#prints a message to say what the file name is
print "Here's your file %r:" % filename

#prints the file cotents
print txt.read()

txt.close()

#prints a message requesting the user to type the file name again
print "Type the filename again:"

#takes the file and inputs it into the variable, file_again
file_again = raw_input("> ")

#opens the file again and sets it the variable txt_again
txt_again= open(file_again)

#prints the file contents
print txt_again.read()

txt_again.close()