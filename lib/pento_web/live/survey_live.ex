defmodule PentoWeb.SurveyLive do
  use PentoWeb, :live_view

  alias __MODULE__.Component
 
  def mount(_params, _session, socket) do
    IO.inspect(socket)
    {:ok, socket}
  end
end