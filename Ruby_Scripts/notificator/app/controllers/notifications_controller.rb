class NotificationsController < ApplicationController
  def index
    @notifications = Notification.all.reverse
  end
end
