class Child < ApplicationRecord
    
    has_many :chores
    has_many :tasks, through: :chores

    validates :first_name, presence: true
    validates :last_name, presence: true

end
