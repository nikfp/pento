defmodule PentoWeb.DemographicLive.Show do
  use Phoenix.Component

  alias Pento.Survey.Demographic
  alias PentoWeb.CoreComponents

  attr :demographic, Demographic, required: true

  def detail(assigns) do
    ~H"""
    <div>
      <h2 class="font-medium text-2xl">
        Demographic
      </h2>
      <CoreComponents.table rows={[@demographic]} id={to_string(@demographic.id)}>
        <:col :let={demographic} label="Gender">
          <%= demographic.gender %>
        </:col>
        <:col :let={demographic} label="Year of Birth">
          <%= demographic.year_of_birth %>
        </:col>
      </CoreComponents.table>
      <ul>
        <li>Gender: <%= @demographic.gender %></li>
        <li>Year of birth: <%= @demographic.year_of_birth %></li>
      </ul>
    </div>
    """
  end
end
