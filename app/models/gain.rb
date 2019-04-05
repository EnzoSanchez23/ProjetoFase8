class Gain < ApplicationRecord
  belongs_to :user

  vailidates_presence_of :description, :user_id
end
