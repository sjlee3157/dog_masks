# Week 4 Notes

## SimpleCov
https://github.com/Ada-Developers-Academy/textbook-curriculum/blob/master/00-programming-fundamentals/code-coverage-and-simplecov.md

```
require 'simplecov'
SimpleCov.start
```

Finally, add the coverage directory to your .gitignore file:

```
$ touch .gitignore
$ echo "coverage" >> .gitignore
$ git add .gitignore
$ git commit -m "Add coverage directory to .gitignore file"
```
## Guard
Guardfile needs a spec helper

```
guard :minitest do
  # with Minitest::Spec
  watch(%r{^specs/(.*)_spec\.rb$})
  watch(%r{^lib/(.+)\.rb$})         { |m| "specs/#{m[1]}_spec.rb" }
  watch(%r{^specs/spec_helper\.rb$}) { 'specs' }
end
```
