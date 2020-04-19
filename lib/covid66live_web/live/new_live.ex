defmodule Covid66liveWeb.NewLive do
    alias Covid66live.Wiki
    use Phoenix.LiveView
    require Logger

    def mount(_params, _session, socket) do
      Logger.debug "mount"
      if connected?(socket), do: :timer.send_interval(1000, self(), :tick)
      viruses = Wiki.get_all_viruses
      {:ok, socket}
      {:ok, assign(socket, viruses: viruses, date: NaiveDateTime.local_now())}
    end

    def handle_info(:tick, socket) do
        {:noreply, put_date(socket)}
    end
    defp put_date(socket) do
        assign(socket, date: NaiveDateTime.local_now())
    end        
  
    def render(assigns) do
      Logger.debug "render"
      ~L"""
      <div>
        <h1>This is my Live View: <%= @date %></h1>
        <ul>
        <%= for virus <- @viruses do %>
            <li><%= virus.name %> : <%= virus.description %></li>
        <% end %>
        </ul>
      </div>
      """
    end
  end