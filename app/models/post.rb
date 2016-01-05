class Post < ActiveRecord::Base
  belongs_to :user

  validates :title
  presence: true,
  length: {
  	minimum: 10,
  	maximum: 100,
  	too_short: "Must have at least 10 characters"
  	too_long: "Must have less than 100 characters"
  }

  validates :link,
  presence: true,
  #URL Validation
  :format => URI::regexp(%w(http https))

  belongs_to :user
  
end
