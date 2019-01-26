# Week 4 Notes

git diff --ignore-all-space

## Questions
- [ ] when do we want to use keyword converter vs. not? see GroceryStore::Order
- [x] why doesn't Rake work on customer_spec.rb?
- [ ] related: what is the scope of symbols?
- [ ] help me fix my AdaGold fork of weekend warrior!
- [ ] do you have to put .self in front of every method in a Module?
- [ ] I could use some git halp
- [ ] Is there a way to have a default puts value for a class?

## Schedule
- [ ] MONDAY: fix bike wheel
- [ ] TUESDAY: food bank?
- [ ] WEDNESDAY: Lightning talk
- [x] THURSDAY: CS Fundamentals homework due
- [ ] THURSDAY: 6:15 somatics

## Homework for Today
- [ ] Flower live code
- [ ] Grocery Store
- [x] Robot Name

## Tutorials To-Do
- [ ] Mixins and Modules
- [ ] Git stuff (like Pull before Push!)
- [ ] Basic Branching: https://git-scm.com/book/en/v2/Git-Branching-Basic-Branching-and-Merging
- [ ] Intro to Ruby classes readings
- [ ] Slack Adabot!
- [ ] Buy a screen glare thingy *Mace*

## Notes

Did you know that you can map a range?!
# this generates 1 random letter
`puts (0...1).map{ ('a'..'z').to_a[rand(26)] }.join`
# A-Z is 65-90 in UTF-8 encoding
# a-z is 97-122 in UTF-8 encoding
`(0...1).map { (65 + rand(26)).chr }.join`
