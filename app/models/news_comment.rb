class NewsComment < ActiveRecord::Base
  belongs_to :news

  validates :comment, presence: true

end
