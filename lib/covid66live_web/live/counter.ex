defmodule Covid66liveWeb.Counter do
    use Phoenix.LiveView
    require Logger

    def mount(_params, _session, socket) do
      Logger.debug "mount"
      {:ok, assign(socket, :val, 0)}
    end
  
    def handle_event("inc", _, socket) do
      {:noreply, update(socket, :val, &(&1 + 1))}
    end
  
    def handle_event("dec", _, socket) do
      {:noreply, update(socket, :val, &(&1 - 1))}
    end
  
    def render(assigns) do
      Logger.debug "render"
      ~L"""
      <div>
        <h1>The count is: <%= @val %></h1>
        <button phx-click="dec">-</button>
        <button phx-click="inc">+</button>
      </div>
      """
    end
  end