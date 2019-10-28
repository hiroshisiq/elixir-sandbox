defmodule Cards do
  @moduledoc """
    Provides methods for creating and handling cards.
  """

  @doc """
    Returns a list of strings representing a deck of cards.

  ## Examples

      iex> Cards.create_deck()
      ["Ace of Hearts", "Two of Hearts", "Three of Hearts", "Four of Hearts",
       "Five of Hearts", "Six of Hearts", "Seven of Hearts", "Eigth of Hearts",
       "Nine of Hearts", "Ten of Hearts", "Jack of Hearts", "Queen of Hearts",
       "King of Hearts", "Ace of Clubs", "Two of Clubs", "Three of Clubs",
       "Four of Clubs", "Five of Clubs", "Six of Clubs", "Seven of Clubs",
       "Eigth of Clubs", "Nine of Clubs", "Ten of Clubs", "Jack of Clubs",
       "Queen of Clubs", "King of Clubs", "Ace of Spades", "Two of Spades",
       "Three of Spades", "Four of Spades", "Five of Spades", "Six of Spades",
       "Seven of Spades", "Eigth of Spades", "Nine of Spades", "Ten of Spades",
       "Jack of Spades", "Queen of Spades", "King of Spades", "Ace of Diamonds",
       "Two of Diamonds", "Three of Diamonds", "Four of Diamonds", "Five of Diamonds",
       "Six of Diamonds", "Seven of Diamonds", "Eigth of Diamonds",
       "Nine of Diamonds", "Ten of Diamonds", "Jack of Diamonds", ...]
  """

  def create_deck do
    values = ["Ace", "Two", "Three", "Four", "Five", "Six", "Seven", "Eigth", "Nine", "Ten", "Jack", "Queen", "King"]
    suits = ["Hearts", "Clubs", "Spades", "Diamonds"]

    for suit <- suits, value <- values do
        "#{value} of #{suit}"
    end
  end

  def shuffle(deck) do
    Enum.shuffle(deck)
  end

  @doc """
    Divides a deck into a hand and the remainder of the deck.

  ## Examples

      iex> deck = Cards.create_deck()
      iex> {hand, deck} = Cards.deal(deck, 2)
      iex> hand
      ["Ace of Hearts", "Two of Hearts"]
  """

  def deal(deck, hand_size) do
    Enum.split(deck, hand_size)
  end

  def contains?(deck, card) do
    Enum.member?(deck, card)
  end

  def save(deck, filename) do
    binary = :erlang.term_to_binary(deck)
    File.write(filename, binary)
  end

  def load(filename) do
    case File.read(filename) do
      {:ok, binary} -> :erlang.binary_to_term(binary)
      {:error, __reason} -> "File '#{filename}' does not exist"
    end
  end

  def create_hand(hand_size) do
    Cards.create_deck()
    |> Cards.shuffle()
    |> Cards.deal(hand_size)
  end

end
