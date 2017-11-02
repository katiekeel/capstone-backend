class TanksChannel < ApplicationCable::Channel
  def follow
    stop_all_streams
    tanks = Tank.all
    stream_for tanks
  end

  def unfollow
    stop_all_streams
  end
end
