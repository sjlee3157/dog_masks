# Week 7 Notes

https://github.com/Ada-Developers-Academy/textbook-curriculum/blob/master/08-rails/what-is-ruby-on-rails.md

Rails' job is to convert an HTTP verb into a CRUDdy action.


# THE STEPS:

1. rails new project-name
2. If there's already a folder for that project, cd into the folder and use . (current directory) as project-name
3. cd project-name
4. git add .; git commit -m "Run rails new"
5. rails db:create
6. rails server

# show.html.erb

- what happens if you give an ID that's not there?
- this is the viewfile for the show method
- by convention, Rails will call this file
- somewhere in the Rails code, it's calling my .show method
- it's also calling the erb file to parse through 'books-show'
- look through books controller and call show

Show is the traditional way of showing information about a single THING.

# Rails Guide on the internet is great

## rails new <directory name>
creates a bunch of subdirectories and files!

|File/Folder|Purpose|
|:---:|-------------|
| app/        | Contains the controllers, models, views, helpers, mailers and assets for your application. You'll focus on this folder for the remainder of this guide. |
| bin/        | Contains the rails script that starts your app and can contain other scripts you use to setup, deploy or run your application. |
| config/     | Configure your application's routes, database, and more. This is covered in more detail in Configuring Rails Applications. |
| config.ru   | Rack configuration for Rack based servers used to start the application. |
| db/         | Contains your current database schema, as well as the database migrations. |
| Gemfile & Gemfile.lock | These files allow you to specify what gem dependencies are needed for your Rails application. These files are used by the Bundler gem. For more information about Bundler, see the [Bundler website](http://bundler.io/). |
| lib/        | Extended modules for your application. |
| log/        | Application log files. |
| public/     | The only folder seen by the world as-is. Contains static files and compiled assets. |
| Rakefile    | This file locates and loads tasks that can be run from the command line. The task definitions are defined throughout the components of Rails. Rather than changing Rakefile, you should add your own tasks by adding files to the lib/tasks directory of your application. |
| README.md | This is a brief instruction manual for your application. You should edit this file to tell others what your application does, how to set it up, and so on. |
| test/       | Unit tests, fixtures, and other test infrastructure. |
| tmp/        | Temporary files (like cache, pid, and session files). |
| vendor/     | A place for all third-party code. In a typical Rails application this includes vendored gems. |

## Monday advice

Chris Mc [14:16]
@channel You may need to run the command `bundle install` to get the Rails command to work after making a new project.

This command reads the Gemfile and installs all the given gems. (edited)

## Route Parameters

### CRUD
- C (create)
  - new: get/books/new
  - create: post/books
- R (route)
  - index (a list/collection, like an arr): get/books
  - show (details about one thing, like an elm): get/books/:id
- U (update)
  - edit: get/books/:id/edit
  - update: patch(or put)/books/:id
- D (destroy)
  - delete: delete/books/:id

### Route parameters
Building a page to show details on an individual book:
/books/NUMBER
/books/3
/books/1

/config/routes.rb
Why will this break?
There's no show action. We haven't made a show method in our controller.

1. start rails server
2. localhost:3000/books/great-gatsby
3. show could not be found

app/views/books/
How do I see what :id is?
Rake program
Raise exception:
def show
  raise
end
Books Controller< Application controller
Refresh screen-- gives a repl
Request Parameters?
Params: hash with key controllers and value books, key action, value show, key id, value "great-gatsby"

How did that get there?
the routes.rb!
/books/:id
key matches routes.rb
value is very top in URL.

in books_controller.rb:
app/controllers/books_controller.rb

def show
  id = params[:id]
end

How did this class get a params attribute? From the Application Controller! (Inherited)
This is a good use for inheritance! (For making many different versions of controllers)

def show
  @id = params
end

In the view (show.html.erb)
<%= "Your Id is #{@id}" %>

In books controller,
.find_by method
(returns nil if not found)

## What is Ruby on Rails?

Rails is a widely-used, Ruby-based MVC web framework (2005). It's fully open-source. It's a DSL: Domain-Specific-Language. It's distributed as a family of gems (30 ish?).

Some web applications built in Rails:
GitHub, Twitter, Hulu, Groupon, Disney, IndieGoGo, YellowPages, LivingSocial.

### Rules:

1. DRY
2. Convention over Configuration

## Monday: Rails class notes
### ERB and layouts:
https://www.google.com/url?q=https%3A%2F%2Fgithub.com%2FAda-Developers-Academy%2Ftextbook-curriculum%2Fblob%2Fmaster%2F08-rails%2FERB-and-Layouts.md&sa=D&usd=2&usg=AFQjCNFMPbevl00ykAbDyIMSy4Wz7Ik0og

the generate command is very powerful, makes corresponding method names and corresponding file names. "convention over configuration".
there's a convention that we normally follow: "crud"
1. create
2. read
3. update
4. delete

preprocesser:
all the ruby code in the rails app that we're about to write, runs on a server, and generates html that we send back to the browser. the user will never see ruby code--they only see html.

check this by going to developer tools in browser. you don't see any ruby. all the logic runs in the server, makes the html, and sends it back.

<% %>
<%# %>
<% @books.each do |book %>
%=  don't forget the equals sign!
<%= book[:title] %>
the equals sign will print out whatever is in the caret into the HTML, and it will show up in the bottom because it's the last line that the loop returns.

We have hardcoded our books controller, so it will always return the same thing.

WE CALL IT RAILS MAGIC.
(Inspect html: where did tall that stuff come from?)
/layouts/application.html.erb
ERB layout: master rails page for my website.

csrf: something for security
"yield" brings in your view.

app/views/layouts/application.html.erb
<%= javascript_include_tag 'application', 'data-turbolinks-track': 'reload' %>
^^ that line is all the javascript i need to know for the whole year

<a href="/">Home</a>
it's a sneaky way to go back to your home page

"/books"
/app/assets/styesheets

CANNOT HAVE 2 RAILS SERVERS RUNNING AT ONCE

## Task List

Generate a controller for tasks
create index action and _______ to
Tasks will have: (hash)
Title, description, status
Do the same thing we just did with books

$ rails db:create is once per project
