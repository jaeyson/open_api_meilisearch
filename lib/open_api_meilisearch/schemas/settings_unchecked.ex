defmodule OpenApiMeilisearch.SettingsUnchecked do
  @moduledoc """
  Provides struct and type for a SettingsUnchecked
  """

  @type t :: %__MODULE__{
          chat: OpenApiMeilisearch.ChatSettings.t() | nil,
          dictionary: [String.t()] | nil,
          displayedAttributes: [String.t()] | nil,
          distinctAttribute: String.t() | nil,
          embedders: map | nil,
          facetSearch: boolean | nil,
          faceting: OpenApiMeilisearch.FacetingSettings.t() | nil,
          filterableAttributes:
            [OpenApiMeilisearch.FilterableAttributesPatterns.t() | String.t()] | nil,
          localizedAttributes: [OpenApiMeilisearch.LocalizedAttributesRuleView.t()] | nil,
          nonSeparatorTokens: [String.t()] | nil,
          pagination: OpenApiMeilisearch.PaginationSettings.t() | nil,
          prefixSearch: String.t() | nil,
          proximityPrecision: String.t() | nil,
          rankingRules: [String.t()] | nil,
          searchCutoffMs: integer | nil,
          searchableAttributes: [String.t()] | nil,
          separatorTokens: [String.t()] | nil,
          sortableAttributes: [String.t()] | nil,
          stopWords: [String.t()] | nil,
          synonyms: map | nil,
          typoTolerance: OpenApiMeilisearch.TypoSettings.t() | nil
        }

  defstruct [
    :chat,
    :dictionary,
    :displayedAttributes,
    :distinctAttribute,
    :embedders,
    :facetSearch,
    :faceting,
    :filterableAttributes,
    :localizedAttributes,
    :nonSeparatorTokens,
    :pagination,
    :prefixSearch,
    :proximityPrecision,
    :rankingRules,
    :searchCutoffMs,
    :searchableAttributes,
    :separatorTokens,
    :sortableAttributes,
    :stopWords,
    :synonyms,
    :typoTolerance
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      chat: {:union, [{OpenApiMeilisearch.ChatSettings, :t}, :null]},
      dictionary: {:union, [[:string], :null]},
      displayedAttributes: {:union, [[:string], :null]},
      distinctAttribute: {:union, [:string, :null]},
      embedders: {:union, [:map, :null]},
      facetSearch: {:union, [:boolean, :null]},
      faceting: {:union, [{OpenApiMeilisearch.FacetingSettings, :t}, :null]},
      filterableAttributes:
        {:union,
         [[union: [:string, {OpenApiMeilisearch.FilterableAttributesPatterns, :t}]], :null]},
      localizedAttributes:
        {:union, [[{OpenApiMeilisearch.LocalizedAttributesRuleView, :t}], :null]},
      nonSeparatorTokens: {:union, [[:string], :null]},
      pagination: {:union, [{OpenApiMeilisearch.PaginationSettings, :t}, :null]},
      prefixSearch: {:union, [{:enum, ["indexingTime", "disabled"]}, :null]},
      proximityPrecision: {:union, [:string, :null]},
      rankingRules: {:union, [[:string], :null]},
      searchCutoffMs: {:union, [{:integer, "u-int64"}, :null]},
      searchableAttributes: {:union, [[:string], :null]},
      separatorTokens: {:union, [[:string], :null]},
      sortableAttributes: {:union, [[:string], :null]},
      stopWords: {:union, [[:string], :null]},
      synonyms: {:union, [:map, :null]},
      typoTolerance: {:union, [{OpenApiMeilisearch.TypoSettings, :t}, :null]}
    ]
  end
end
