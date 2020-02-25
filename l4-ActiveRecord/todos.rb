require "active_record"

class Todo < ActiveRecord::Base
  def show_list
    status = completed ? "[X]" : "[ ]"
    disp_date = due_date == Date.today ? nil : due_date
    puts "#{id}. #{status} #{todo_text} #{disp_date}"
  end

  def self.show_list
    puts "My Todo List\n\n"
    puts "Overdue\n"
    all.map do |todo|
      if todo.due_date < Date.today
        todo.show_list
      end
    end
    puts "\n\nDue Today\n"
    all.map do |todo|
      if todo.due_date == Date.today
        todo.show_list
      end
    end
    puts "\n\nDue Later\n"
    all.map do |todo|
      if todo.due_date > Date.today
        todo.show_list
      end
    end
  end

  def self.add_task(hash)
    Todo.create!(todo_text: hash[:todo_text], due_date: Date.today + hash[:due_in_days], completed: false)
  end

  def self.mark_as_complete!(todo_id)
    todo = Todo.find(todo_id)
    todo.completed = true
    todo.save
    todo
  end
end
