defmodule Covid66liveWeb.VirusListLive do
    use Phoenix.LiveView
    require Logger

    def mount(_params, _session, socket) do
      Logger.debug "mount"
      {:ok, socket}
    end
  
    def render(assigns) do
      Logger.debug "render"
      ~L"""
      <div>
        <h1>This is my Live View</h1>
      </div>
      """
    end
  end