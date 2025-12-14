defmodule OpenApiMeilisearch.TypoSettings do
  @moduledoc """
  Provides struct and type for a TypoSettings
  """

  @type t :: %__MODULE__{
          disableOnAttributes: [String.t()] | nil,
          disableOnNumbers: boolean | nil,
          disableOnWords: [String.t()] | nil,
          enabled: boolean | nil,
          minWordSizeForTypos: OpenApiMeilisearch.MinWordSizeTyposSetting.t() | nil
        }

  defstruct [
    :disableOnAttributes,
    :disableOnNumbers,
    :disableOnWords,
    :enabled,
    :minWordSizeForTypos
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      disableOnAttributes: {:union, [[:string], :null]},
      disableOnNumbers: {:union, [:boolean, :null]},
      disableOnWords: {:union, [[:string], :null]},
      enabled: {:union, [:boolean, :null]},
      minWordSizeForTypos: {:union, [{OpenApiMeilisearch.MinWordSizeTyposSetting, :t}, :null]}
    ]
  end
end
