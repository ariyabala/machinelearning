# machinelearning
My own projects to try out machine learning components

Installation of Octave on Mac:
--------------------------------
http://adampash.com/how-to-install-octave/

Error:


gnuplot> set terminal aqua enhanced title "Figure 3" size 560 420  font "*,6" dashlength 1
                      ^
         line 0: unknown or ambiguous terminal type; type just 'set terminal' for a list
         
Solution:
---------

system gnuplot
set term aqua

octave --force-gui

