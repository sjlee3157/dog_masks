# Week 3 Notes

## Questions
- [x] can you call Modules within other Modules? methods? (yes)
- [ ] do you have to put .self in front of every method in a Module?
- [x] why won't rake run on CSV practice specs?
- [x] weekend warrior: ruby 2.4.1?
- [ ] I could use some git halp
- [ ] Is there a way to have a default puts value for a class?

## Classes, modules, namespaces
- instance_method is inside a Class
- method is inside a Module, or not
- `::` accesses Constants, Classes, and OtherModules
- `.` accesses methods

## Intro to Objects in Ruby
- Classes: CamelCase
- .new: instances of classes called Array and Hash (syntactic sugar is " " and [ ])
- State vs. Behavior
    - state: data/attributes that object will keep track of
    - behavior: methods that operate on that state
- Class: Ruby thing
- describe the object with a class (idea of a car), instantiate an instance of it
- Namespacing: It's a similar idea to putting files into directories. Files in the same directory cannot have the same name, but files in different directories may.


## Git Immersion Labs

> `~/.gitconfig`  
`~/.profile`

Completed: Lab 28  
http://gitimmersion.com/lab_29.html

| Command   | Description   |
| :-------- | :------------- |
| $ type   | cat-file -t |
| $ dump   | cat-file -p |
| $ cat `file` | print `file` from current checkout |
| $ git tag `tag` | tag commit from current checkout |
| $ go `tag` | checkout tagged commit |
| $ git reset HEAD `file` | unstages change (resets staging area to be whatever is in HEAD). by default, this does NOT change the working directory (local computer), which will still have the changes in it (see below!) |

#### **Important:
> The `$ go` (checkout) command will MAKE YOU LOSE your unstaged changes!

| Command   | Description   |
| :-------- | :------------- |
| $ go `file` | reset working directory to committed version, discarding unstaged changes |
| $ git revert HEAD | rewrites current branch to point to the specified commit (here, HEAD), but the revert is logged |
| $ git revert `HASH` | "" |
| $ git tag `oops` | tag the commit you want to hard reset |
| $ git reset --hard `oldtag` | hard reset to `oldtag`(undo to tagged commit; working directory updated to be consistent with the new branch head) |
| $ git tag -d `oopstag` | perma deletes `oopstag` commit |
| $ gc --amend -m "Edited commit message" | merges currently staged commit with previous and overwrites commit message |

| Command   | Description   |
| :-------- | :------------- |
| $ git hist   | default: only current branch    |
| $ git hist --all       | all branches       |
| $ go `master`    | move local computer to HEAD branch    |
| $ go -b `newbranch` | make `newbranch`, local computer goes to `newbranch` |
| $ gs | shows which branch |
| $ touch `newfile`; atom `newfile` | make `newfile` & edits|
| $ ga `newfile`; gc -m "Added Newclass" | stage & commit |
| $ touch `oldfile`; atom `oldfile` | make `oldfile` reference `newfile` |
| $ ga `oldfile`; gc -m "`oldfile` uses Newclass" | stage & commit |
| $ git hist --all | see no branch graphic |
| $ go `master`; touch `anotherfile`; ga `anotherfile`; gc -m "Added `anotherfile`" | move local computer (HEAD) to `master` branch, make `anotherfile`, stage and commit |
| $ gs | nothing to commit, working tree clean |
| $ git hist --all | see ASCII branch graphic |
| $ go `newbranch` | move HEAD to `newbranch` |
| $ git merge `master` | merge `master` into `newbranch` (Merge made by the 'recursive' strategy.) |

## Leap Year
http://www.youtube.com/watch?v=xX96xng7sAE

Calendar year: 8760h
Year: 8765h 48m 46s
Ballerina on the back of a truck
Leap years are off by 1 day every century
Skip the century
Unless /400
1 day off in 8,000 years
Keeps calendar in sync with the seasons
