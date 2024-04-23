defmodule Pento.Promo do
  alias Pento.Promo.Recipient

  def change_recipient(%Recipient{} = recipient, attrs \\ %{}) do
    Recipient.changeset(recipient, attrs)
  end

  def send_promo(%{changes: %{first_name: first_name}} = recipient, _attrs \\ %{}) do
    IO.puts("You send a promo code to #{first_name} ")

    {:ok, %Recipient{}}
  end
end
