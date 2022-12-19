class DesksChannel < ApplicationCable::Channel
  def subscribed
    # puts params
    desk = Desk.find(params[:id])
    stream_for desk
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def recerive(data)
    # puts data
  end
end
