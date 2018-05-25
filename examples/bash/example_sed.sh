# `sed` is the stream editor, in that you can use | (pipe) to send standard streams (STDIN and STDOUT specifically) through sed and alter them programmatically on the fly, making it a handy tool in the Unix philosophy tradition; but can edit files directly, too, using the -i parameter mentioned below.
# Consider the following:

sed -i -e 's/few/asd/g' hello.txt

# `s/` is used to substitute the found expression few with asd:

# "The few, the brave."

# "The asd, the brave."

# `/g` stands for "global", meaning to do this for the whole line. If you leave off the /g (with s/few/asd/, there always needs to be three slashes no matter what) and few appears twice on the same line, only the first few is changed to asd:

# "The few men, the few women, the brave."

# "The asd men, the few women, the brave."

# This is useful in some circumstances, like altering special characters at the beginnings of lines (for instance, replacing the greater-than symbols some people use to quote previous material in email threads with a horizontal tab while leaving a quoted algebraic inequality later in the line untouched), but in your example where you specify that anywhere few occurs it should be replaced, make sure you have that /g.

# The following two options (flags) are combined into one, -ie:

# -i option is used to edit in place on the file hello.txt.

# -e option indicates the expression/command to run, in this case s/.

# Note: It's important that you use -i -e to search/replace. If you do -ie, you create a backup of every file with the letter 'e' appended.