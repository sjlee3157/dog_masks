# Ruby Style Guide
https://github.com/rubocop-hq/ruby-style-guide

Prefer map over collect, find over detect, select over find_all, reduce over inject and size over length.

Leverage the fact that if and case are expressions which return a result.

```
# bad
if condition
  result = x
else
  result = y
end

# good
result =
  if condition
    x
  else
    y
  end
```
