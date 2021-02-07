class Task < ApplicationRecord

    has_many :chores
    has_many :children, through: :chores

    validates :name, presence: true
    validates :points, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

    scope :alphabetical, -> { order(name: :asc) }
    scope :active, -> { where(active: true).order(name: :asc) }

end
