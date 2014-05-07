These tools can help automate some aspects of Android development.

rm_unused_resources
=======================

Remove unused resources as determined by Android lint.


Usage:
a) Run lint from within Android Studio.  Specifically, the "Unused resources" lint.
b) Export this lint to xml.  There's an icon in Android studio to do so.
c) Run this script:

ruby ./rm_unused_resources.rb <lint.xml file location>  <root of your Android Studio project>


Notes: 
1) This will delete without prompting, so be careful or use source control!


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
