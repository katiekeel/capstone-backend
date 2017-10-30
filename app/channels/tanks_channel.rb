class TanksChannel < ApplicationCable::Channel
  def follow
    stream_from "tanks"
  end

  def unfollow
    stop_all_streams
  end
end
