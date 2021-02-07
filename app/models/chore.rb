class Chore < ApplicationRecord

    belongs_to :child
    belongs_to :task

    validates_datetime :due_on

    def status
        case completed
        when true
            return "Completed"
        when false
            return "Pending"
        end 
    end

    scope :by_task,  -> { joins(:task).order("name") }
    scope :chronological, -> { order(due_on: :asc, completed: :asc) }

    scope :pending, -> { where(completed: false) }
    scope :done, -> { where(completed: true) }
    scope :upcoming, -> { where('due_on >= ?', DateTime.now) }
    scope :past, -> { where('chores.due_on < ?', DateTime.now) }

end
