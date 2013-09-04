androidstringsxmlsorter
=======================

Simple script to alphabetically sort android strings.xml file


Usage:
ruby ./stringsxmlsorter.rb <path to strings.xml file>

The sorted xml file will print out to STDOUT.


Notes: 
1) Tested only with ruby 1.9, but should work with older
ruby versions. 
2) This does a simple regex parse.  Complicated stirngs may
not work well.