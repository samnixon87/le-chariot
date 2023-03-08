class Channel < ApplicationRecord
  has_many :chatroom_messages
end
