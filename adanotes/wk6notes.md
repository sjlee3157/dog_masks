# Wk6 Notes - CSS & HTML, static websites

rem = x the normal font size. chris prefers this.
rem vs. em: rem scales relative to screen, em scales to block / container

Each page must have a:
-  Doctype, head, and body of an HTML
-  A header/title Section
-  Navigation section with links for the site
-  A footer with a copyright notice and your name -->

<!-- The homepage of your site is named `index.html`. This page will have:
-  A header section with the title for your book review site
-  A section for navigation
-  A main content section with an unordered list of the top-5 book images (see the images folder)
  - Each image should link to their page in Amazon.com or a book review page. -->

Precedence:
IDs are the most specific <id="someid"> #someid
classes, attributes, & pseudo classes <class="someclass"> .someclass, :hover 
Elements and pseudo-elements <tag> ::after


## selectors (Diner)
A
2A
3#id
4A  B
5#id  A
6.classname
7A.className
8Put your back into it!
9A, B
10*
11A  *
12A + B
13A ~ B
14A > B
15:first-child
16:only-child
17:last-child
18:nth-child(A)
19:nth-last-child(A)
20:first-of-type
21:nth-of-type(A)
22:nth-of-type(An+B)
23:only-of-type
24:last-of-type
25:empty
26:not(X)
27[attribute]
28A[attribute]
29[attribute="value"]
30[attribute^="value"]
31[attribute$="value"]
32[attribute*="value"]
