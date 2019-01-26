# Week 10

## Session/ Filter?
filter: can dry up code, stuff we do repetitively that always gets run - method that always runs

## Flash Notices

anytime you use a render, use flash.now (rest of the request cycle)
for redirects, use flash (rest of the request AND the next complete cycle)
params (the corresponding request cycle)

if @book.save
  flash.success
else # save failed :(
  flash.now[:error] = 'Book not created'
end

error messages are an array (could break >1 validation for given field)

if message.class == Array
else
end

## Model Testing Review

### Upvote (new vote):
user not logged in (DON'T TEST THIS WITH MODELS (models can't test if logged in)
#### edge cases
- uniqueness of user/work pair
  1. fail: test where user already has a vote for that work
  2. pass: test where user does not have a vote for that work

### Works by category sorted by votes:
#### edge cases
- no works for that category
- no votes for that category
- tiebreaking


## Fixtures Review



## Bootstrap

Need to manually install Bootstrap to any previous projects

## Testing lecture Monday
1. Validations
2. Relationships
3. Custom methods

Always test all relationships!

```
describe 'Relationships' do
  it 'belongs to an author' do
    # Arrange (done with let)

    # Act
      author = book.author
    # Assert
      expect(author).must_be_instance_of Author
  end
end
```

Break 1 and ONLY 1 thing

```
describe 'Validations' do
  it 'must have a title' do
    # Arrange
      book.title = nil
    # Act
      #valid = book.valid?
      valid = book.save
      # why valid? instead of save -- they both return boolean, they both print errors
      # only reason is readability!

    # Assert
      expect(valid).must_equal false
      expect(book.errors.messages).must_include :title
  end
end
```
