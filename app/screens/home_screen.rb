class HomeScreen < PM::TableScreen
  title "Home"
  refreshable
  row_height :auto

  def on_load
    set_nav_bar_button :right, title: "Friends", action: :show_friends
    @server_data = []
  end

  def will_appear
    load_server_data if @server_data.length == 0
  end

  def table_data
    [{
      cells: @server_data.map do |server|
        if server['NumPlayers'] > 0
          {
            title: server['ServerName'].gsub(/\[PR\sv(.*)(\d)+\]\s/, ""),
            subtitle: "#{server['MapName']} - #{server['NumPlayers']} of #{server['MaxPlayers']}",
            action: :server_details,
            arguments: server
          }
        else
          {}
        end
      end
    }]
  end

  def on_refresh
    load_server_data
  end

  def show_friends
    open FriendsScreen
  end

  def load_server_data
    start_refreshing
    AFMotion::HTTP.get("http://www.realitymod.com/prspy/json/serverdata.json?now") do |response|
      $r = response
      if response.success? && response.object
        # @server_data = response.object['Data']
        update_table_data
      elsif response.failure?
        PM.logger.warn response.error.localizedDescription
      end
      stop_refreshing
    end
  end

  def server_details(server)
    open ServerScreen.new(nav_bar: true, server: server)
  end

end
