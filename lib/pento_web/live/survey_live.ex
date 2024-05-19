defmodule PentoWeb.SurveyLive do
  use PentoWeb, :live_view

  def mount(_params, _session, socket) do
    IO.inspect(socket)
    {:ok, socket}
  end
end
