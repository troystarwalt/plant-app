class Post < ActiveRecord::Base
  belongs_to :user

  validates :content, presence: true, length: {maximum: 250, too_long: "maximum characters is %{count} characters" }
end
