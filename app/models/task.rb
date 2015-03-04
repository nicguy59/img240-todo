class Task < ActiveRecord::Base
  scope :recent, -> { order('created_at DESC') }
end
