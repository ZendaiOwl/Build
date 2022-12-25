# Wildcards

Wildcards are really nothing new if you have used Unix at all before.

It is not necessarily obvious how they are useful in shell scripts though. This section is really just to get the old grey cells thinking how things look when you're in a shell script - predicting what the effect of using different syntaxes are. This will be used later on, particularly in the Loops section.

Think first how you would copy all the files from /tmp/a into /tmp/b. All the .txt files? 

All the .html files?

Hopefully you will have come up with:

> $ cp /tmp/a/* /tmp/b/

> $ cp /tmp/a/*.txt /tmp/b/

> $ cp /tmp/a/*.html /tmp/b/

Now how would you list the files in /tmp/a/ without using ls /tmp/a/?

How about echo /tmp/a/*? 

What are the two key differences between this and the ls output? 

How can this be useful? 

Or a hinderance?

How could you rename all .txt files to .bak? 

Note that

> $ mv *.txt *.bak

will not have the desired effect; think about how this gets expanded by the shell before it is passed to mv. Try this using echo instead of mv if this helps.

We will look into this further later on, as it uses a few concepts not yet covered.