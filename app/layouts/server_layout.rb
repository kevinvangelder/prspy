class ServerLayout < MK::Layout
  def layout
    add UIImageView, :server_logo
  end

  def server_logo_style
    image "".uiimage
    clips_to_bounds true
    constraints do
      left 20
      top 84
      width 100
      height 100
    end
  end
end