class Child < ApplicationRecord
    
    has_many :chores
    has_many :tasks, through: :chores

    validates :first_name, presence: true
    validates :last_name, presence: true

    def name
        self.first_name +" " + self.last_name
    end

    scope :alphabetical, -> { order(first_name: :asc) }
    scope :active, -> { where(active: true).order(first_name: :asc) }


end
