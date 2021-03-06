defmodule LiveViewExamplesWeb.Layout do
  use Phoenix.LiveView

  alias LiveViewExamplesWeb.ObserverLive

  def render(assigns) do
    ~L"""
    <div>
      <div class="controls">
        <div class="tabs">
          <button class="<%= if @settings[:view] == :home, do: "active" %>" phx-click="render_home">Home</button>
          <button class="<%= if @settings[:view] == :network, do: "active" %>" phx-click="render_network">Network</button>
          <button class="<%= if @settings[:view] == :system, do: "active" %>" phx-click="render_system">System</button>
          <button class="<%= if @settings[:view] == :ets, do: "active" %>" phx-click="render_ets">ETS</button>
          <button class="<%= if @settings[:view] == :mnesia, do: "active" %>" phx-click="render_mnesia">Mnesia</button>
          <button class="<%= if @settings[:view] == :app, do: "active" %>" phx-click="render_app">App</button>
        </div>

        <div class="interval-controls">
          <span class="interval">Interval ⏱</span>
          <button class="btn-interval" phx-click="interval_decrease">-</button>
          <span class="interval-val"><%= @settings[:interval] %>ms</span>
          <button class="btn-interval" phx-click="interval_increase">+</button>
        </div>
      </div>

      <div class="view">
        <%= ObserverLive.render(@settings[:view], assigns) %>
      </div>
    </div>
    """
  end
end
