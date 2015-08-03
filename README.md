# Unified-File Idea

Suppose you start writing a program in one giant file. You specify the
section of code you are working on based on an anchor tag. The ending
of this tag, determines how the file is compiled and the syntax highlighting
for this section.

This allows you to write any type of code all in the same place. Check out
the [example web app](/program) for a simple example of how this works. Using
these tags, we can compile this one big file into individual files -- check out
[the build files](/build).

Here some some benefits right off the bat:

- you dont have to jump around between files so much because you can write
  different types of code right next to each other.
- the load order and variable closures are explicit. You don't have to worry
  about `module.exports` and `require`ing everywhere in between files.
- a program written like this ought to be much more approachable. you dont have
  to search through files to find where the program begins. With this one large
  file, you can see chronologically how the program was built.

The question I keep getting asked is how this is any different from jumping
around a big file with fuzzy search. This one giant file is the canonical
file, but you can slice and dice this file into smaller "pseudo-files" for
editing. These "pseudo-files" are the results of querying against the anchor
tags. When you edit/save one of these pseudo-files, it should update the
appropriate section in the canonical file. These smaller files are convenient
to edit certain sections of code next to each other.

For example, you can query with "app" and get a [new tab](/tabs/app) containing
all of the sections with that tag in it. [Same with "counter"](/tabs/counter).
As you can see, we have the jsx right next to the css which is nice.
I could imagine a more complicated syntax for filtering here as well.

You can also write your documentation right next to the code and compile the
documentation just as we did for the files in the build folder.

# What needs to happen

- Coding without syntax highlighting sucks a lot, so we need to be able to use
  the anchor tag ending to select the correct highlighting from within Atom.io
- Creating new tabs based on queries, editing those tabs, and saving those
  results in the canonical file
- Integrate with some build existing build systems and transpilers (coffee, jsx
  stylus, less, scss, etc.)

# Running the example

You can run the example with `coffee parse.coffee` which will compile `program`
into the build and tabs folders.
