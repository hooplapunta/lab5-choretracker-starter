class Child < ApplicationRecord
    
    has_many :chores
    has_many :tasks, through: :chores

    validates :first_name, presence: true
    validates :last_name, presence: true

    def name
        first_name + " " + last_name
    end 
    
    def points_earned
        self.chores.done.inject(0){|sum,chore| sum += chore.task.points}
    end 

    scope :alphabetical, -> { order(first_name: :asc) }
    scope :active, -> { where(active: true).order(first_name: :asc) }


end
