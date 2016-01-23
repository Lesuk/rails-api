class Story < ActiveRecord::Base
  belongs_to :user

  validates :body, :title, :user, presence: true
end
