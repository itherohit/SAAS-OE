require "./connect_db.rb"
require "./todos.rb"

connect_db!
Todo.show_list
