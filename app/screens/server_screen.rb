class ServerScreen < PM::Screen
  attr_accessor :server

  def on_load
    self.title server['ServerName'].gsub(/\[PR\sv(.*)(\d)+\]\s/, "")
    @layout = ServerLayout.new(root: self.view).build
    set_nav_bar_button :back, title: "Back", action: :back
  end
end