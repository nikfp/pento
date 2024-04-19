defmodule PentoWeb.WrongLive do
  use PentoWeb, :live_view

  def mount(_params, _session, socket) do
    {
      :ok,
      assign(
        socket,
        score: 0,
        message: "Make a guess",
        time: time(),
        answer: start_number()
      )
    }
  end

  @spec render(any) :: Phoenix.LiveView.Rendered.t()
  def render(assigns) do
    ~H"""
    <h1 class="mb-4 text-4xl font-extrabold">Your Score: <%= @score %></h1>
    <h2><%= @message %></h2>
    <h2>Time of last click: <%= @time %></h2>
    <br />
    <h2>
      <%= for n <- 1..10 do %>
        <.link
          class="bg-blue-500 hover:bg-blue-700 text-white
            font-bold py-2 px-4 border border-blue-700 rounded m-1
            "
          phx-click="guess"
          phx-value-number={n}
        >
          <%= n %>
        </.link>
      <% end %>
    </h2>
    """
  end

  def handle_event("guess", %{"number" => guess}, socket) do
    %{:answer => answer, :score => score} = socket.assigns
    IO.inspect(answer)

    if answer == String.to_integer(guess) do
      message = "You won! The answer is #{answer}!"
      score = score + 1

      {
        :noreply,
        assign(
          socket,
          message: message,
          score: score,
          time: time()
        )
      }
    else
      message = "Your guess: #{guess}. Wrong. Guess again. "

      {
        :noreply,
        assign(
          socket,
          message: message,
          score: score,
          time: time()
        )
      }
    end
  end

  defp time() do
    DateTime.utc_now() |> to_string
  end

  defp start_number() do
    Enum.random(1..10)
  end
end
