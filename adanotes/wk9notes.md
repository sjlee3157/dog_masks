# Week 9 notes

## Nested Routes review

request a ride: POST passengers/:passenger_id/trips trips#create
GET passengers/:passenger_id/trips trips#index


## Rails validation review
### Makes sure the site scales and can handle as many users as possible

Book model

validates :title, presence: true, length: { in: 5..20 }
when validations fail, how can you check? where does it tell you?
.errors
Errors are saved in an errors hash like title: ['Must be unique']

<% if @book.errors.any? %>
{
  title: ['Must be unique'], 'must be longer than 5 characters'],
  author: ['must exist']
}
  <ul class="errors">
    <% @book.earrors.each do |col, msg| %>
      <li>
        <strong><%= column.capitalize %></strong><%= message %>
      </li>
    <% end %>
  </ul>
<% end %>

form_with is new to Rails (5.2!)
The problem with vaildations in class yesterday--the errors weren't showing because form_with locals:false

add file action_view.rb in /config/initializers (initialize Rails with certain settings)
add one really long line that says "don't do remote forms, do it like a regular HTML form"
turns it off for every form_with
Rails.application.config.action_view.form_with_generates_remote_forms = false

def update
  if @book.update(book_params)
    redirect_to book_path(@book.id)
