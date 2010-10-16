# Fork of "shiftit" - Mac OS X Window Management Utility #

## Origin ##

Forked from this project: [http://code.google.com/p/shiftit/](http://code.google.com/p/shiftit/)

Original author: [Aravindkumar Rajendiran](http://ca.linkedin.com/in/aravind88)

License: [GNU General Public License v3](http://www.gnu.org/licenses/gpl.html)

## Goals of Fork ##

This project was forked in order to customize how it works and add new functionality.  Currently, things like keyboard shortcuts cannot be customized, and the only way to change them is by modifying the source code and recompiling.  

Features that have been added:

* Resize windows to a percentage (multiples of 10).  To resize the current window to a specific percentage, you can press Command-Option-*n*, where the percentage is *n* * 10% (keys 6-9 can be used).  For example, to resize a window to a size that is 60% of the screen, you would press a keyboard shortcut like Command-Option-6.  Percentages are also accessible from the menu.  When using keys 1-5, only width is adjusted by percentage, using 30%-70% respectively.

Ideas of new features to add:

* Move windows to different monitors
* Configuration of shortcut keys.  This will likely not be user-friendly at first (e.g. reading in a file with keycodes).  It may also allow disabling of actions that aren't used.
* Easy keyboard shortcut for unminimizing windows
* Move windows to corners or side of screen without resizing
* Ability to resize windows to percentages for width or height only
