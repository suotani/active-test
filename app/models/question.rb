class Question < ApplicationRecord
    belongs_to :test
    validates :text, presence: true
end
