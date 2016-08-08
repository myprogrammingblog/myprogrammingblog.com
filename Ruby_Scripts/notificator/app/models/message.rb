class Message < ApplicationRecord
  after_create_commit { notify }

  private

  def notify
    Notification.create "New Notification"
  end
end
