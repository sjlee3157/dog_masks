# Week 2

## To-Do!
- [ ] Read Git links
- [ ] Read Pry links
- [ ] Read Minitest links
- [ ] Thursday CS funds homework
- [ ] Start git immersion labs
- [ ] Grokking Algorithms
- [ ] Sat @ 9: SBP!
- [ ] How do you set up rakefile?
- [ ] https://github.com/ada-c10/csv-practice
- [ ] review the program structure in Adagrams!

## Questions:
1. ~~can pry work with minitest?~~
1. Act-assert: how do we see the results of the first part? Why do we use act-assert?
1. problem from last night with cloning ada-c10, not my own fork
1. ~~i'm still v confused about cloning. i should look at a tutorial/map it out.~~
1. ~~why does line 81 mess up my minitest in blackjack_score_spec ???!~~
1. why is there no repo even when I fork/clone? "Hmm, there's nothing to compare this file to". Is it because I cloned without forking?

## CSV as a DB
Never use the absolute path.

### CSV `.open` method:
`CSV.open(filename, mode='r', options) {|file| block}`
- 1 required argument, 3 optional arguments, optional block
- `mode` sets what permissions Ruby has to the file when it is opened
- The block: `{|file| block}`
    - File contents passed to the block as a local variable
    - Ruby: OPEN FILE > RUN BLOCK CODE > CLOSE FILE
    - Ex: `CSV.open("planet_data.csv", "r").each {|line| puts line}`

|Mode |  Meaning
|:---:|-----------------------------------------------------------|
|"r"  |  Read-only, starts at beginning of file  (default mode)   |
|"r+" |  Read-write, starts at beginning of file.                 |
|"w"  |  Write-only, truncates existing file to zero length       |
|"w+" |  Read-write, truncates existing file to zero length.      |
|"a"  |  Append write-only, starts at end of file if file exists. |
|"a+" |  Append read-write, starts at end of file if file exists. |
|"b"  |  Binary file mode                                         |
|"t"  |  Text file mode                                           |

## More complex conditionals!
```
value = "Pasta"
value ||= "Meatballs"
puts value # => "Pasta"

value = false
value ||= "Ramen"
puts value #=> "Ramen"

value = nil
value ||= "Omelet"
puts value #=> "Omelet"

# long form:
value = "Oreo"
value = value || "Omelet"
puts value #=>"Oreo"

value = false
value = value || "Ice Cream"
puts value #=> "Ice Cream"

new_stuff ||= "Curry"
puts new_stuff #=> "Curry"

my_hash = {}
my_hash[:student] ||= "Jane"
puts my_hash #=> {:student=>"Jane"}

morgue = {}
morgue[:body_name] ||= "Jane Doe"
puts morgue #=> {:body_name=>"Jane Doe"}
morgue[:body_name] ||= "John Doe"
puts morgue #=> {:body_name=>"Jane Doe"}
```

## Keyword arguments
- Vocab:
  - *positional* and *keyword* arguments
  - *optional arguments* to simplify method signatures
  - *default values* for parameters
- Positional arguments need to

## Git cheatsheet
| Command             | Description |
|---------------------|-------------|
| `git init`          | Initialize an empty git repository
| `git clone <URI>`   | Initialize a git repository from the GitHub repository at the URI
| `git remote -v`     | See where you cloned this repository from
| `git status`        | See the current state of a git repo
| `git diff`          | Show unstaged changes
| `git add <file>`    | Stage (mark as ready to commit) a file
| `git diff --staged` | Show staged changes
| `git commit`        | Commit all staged files. Will drop into an editor unless the `-m <message>` option is provided.
| `git log`           | See a summary of all previous commits
| `git show`          | Show the most recent commit
| `git show <hash>`   | Show the commit with that hash
| `git pull`          | Pull down all new commits from GitHub
| `git push`          | Push all local commits to GitHub

## Pry
- *ls*, shows you the local variables defined in the current context, and any public methods or instance variables defined on the current object.
- *cd*, command is used to move into a new object (or scope) inside a Pry session. When inside the new scope it becomes the self for the session and all commands and methods will operate on this new self.
- https://github.com/pry/pry/wiki/State-navigation#Ls
- https://learn.co/lessons/debugging-with-pry
- http://pryrepl.org/

## Git push activity
```
samjo-macbook-air:git-pull-activity samjo$ git push
To https://github.com/tfrego/git-pull-activity.git
 ! [rejected]        master -> master (fetch first)
error: failed to push some refs to 'https://github.com/tfrego/git-pull-activity.git'
hint: Updates were rejected because the remote contains work that you do
hint: not have locally. This is usually caused by another repository pushing
hint: to the same ref. You may want to first integrate the remote changes
hint: (e.g., 'git pull ...') before pushing again.
hint: See the 'Note about fast-forwards' in 'git push --help' for details.
```

## Minitest
```
require 'minitest/autorun'
require 'minitest/reporters'
require 'minitest/skip_dsl'

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative "../lib/*"
```

## Rakefile
```
# Rakefile
require 'rake/testtask'

Rake::TestTask.new do |t|
  t.libs = ["lib"]
  t.warning = true
  t.test_files = FileList['specs/*_spec.rb']
end

task default: :test
```
## Ruby Gems
```
require "pry"
require "awesome_print"

array = [1,2,3,4]
puts "hello".red
num = 0
binding.pry
array.each do |x|
  num += x
end
```
