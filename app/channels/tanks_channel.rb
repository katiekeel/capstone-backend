class TanksChannel < ApplicationCable::Channel
  def follow
    stop_all_streams
    stream_from "tanks"
  end

  def unfollow
    stop_all_streams
  end
end
