module BannersHelper

  def banner_orientation position
    position == "first" ? "left" : "right"
  end
end
