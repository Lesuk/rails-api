class Story < ActiveRecord::Base
  belongs_to :user

  validate :body, :text, :user, presence: true
end
