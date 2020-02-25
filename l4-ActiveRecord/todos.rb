require "active_record"

class Todo < ActiveRecord::Base
  def to_displayable_string
    status = completed ? "[X]" : "[ ]"
    disp_date = due_date == Date.today ? nil : due_date
    "#{id}. #{status} #{todo_text} #{disp_date}"
  end

  def self.overdue
    all.where("due_date < ?", Date.today)
  end

  def self.due_today
    all.where("due_date = ?", Date.today)
  end

  def self.due_later
    all.where("due_date > ?", Date.today)
  end

  def self.show_list
    puts "My Todo List\n\n"
    puts "Overdue\n"
    puts overdue.map { |todo| todo.to_displayable_string }
    puts "\n\nDue Today\n"
    puts due_today.map { |todo| todo.to_displayable_string }
    puts "\n\nDue Later\n"
    puts due_later.map { |todo| todo.to_displayable_string }
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
