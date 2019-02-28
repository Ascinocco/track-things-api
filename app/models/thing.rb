class Thing < ApplicationRecord
  belongs_to :user, optional: true

  # @TODO: Only validate presence on certain actions
  # validates_presence_of :title
end
