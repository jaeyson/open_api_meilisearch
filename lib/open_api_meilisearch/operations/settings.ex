defmodule OpenApiMeilisearch.Settings do
  @moduledoc """
  Provides API endpoints related to settings
  """

  @default_client OpenApiMeilisearch.Client

  @doc """
  Reset settings

  Reset all the settings of an index to their default value.
  """
  @spec delete_all(indexUid :: String.t(), opts :: keyword) ::
          {:ok, OpenApiMeilisearch.SummarizedTaskView.t()}
          | {:error, OpenApiMeilisearch.ResponseError.t()}
  def delete_all(indexUid, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [indexUid: indexUid],
      call: {OpenApiMeilisearch.Settings, :delete_all},
      url: "/indexes/#{indexUid}/settings",
      method: :delete,
      response: [
        {200, {OpenApiMeilisearch.SummarizedTaskView, :t}},
        {401, {OpenApiMeilisearch.ResponseError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Reset chat

  Reset an index's chat to its default value

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec deletechat(
          indexUid :: String.t(),
          body :: OpenApiMeilisearch.ChatSettings.t(),
          opts :: keyword
        ) ::
          {:ok, OpenApiMeilisearch.SummarizedTaskView.t()}
          | {:error, OpenApiMeilisearch.ResponseError.t()}
  def deletechat(indexUid, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [indexUid: indexUid, body: body],
      call: {OpenApiMeilisearch.Settings, :deletechat},
      url: "/indexes/#{indexUid}/settings/chat",
      body: body,
      method: :delete,
      request: [{"application/json", {OpenApiMeilisearch.ChatSettings, :t}}],
      response: [
        {200, {OpenApiMeilisearch.SummarizedTaskView, :t}},
        {401, {OpenApiMeilisearch.ResponseError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Reset dictionary

  Reset an index's dictionary to its default value

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec deletedictionary(indexUid :: String.t(), body :: [String.t()], opts :: keyword) ::
          {:ok, OpenApiMeilisearch.SummarizedTaskView.t()}
          | {:error, OpenApiMeilisearch.ResponseError.t()}
  def deletedictionary(indexUid, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [indexUid: indexUid, body: body],
      call: {OpenApiMeilisearch.Settings, :deletedictionary},
      url: "/indexes/#{indexUid}/settings/dictionary",
      body: body,
      method: :delete,
      request: [{"application/json", [:string]}],
      response: [
        {200, {OpenApiMeilisearch.SummarizedTaskView, :t}},
        {401, {OpenApiMeilisearch.ResponseError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Reset displayedAttributes

  Reset an index's displayedAttributes to its default value

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec deletedisplayed_attributes(indexUid :: String.t(), body :: [String.t()], opts :: keyword) ::
          {:ok, OpenApiMeilisearch.SummarizedTaskView.t()}
          | {:error, OpenApiMeilisearch.ResponseError.t()}
  def deletedisplayed_attributes(indexUid, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [indexUid: indexUid, body: body],
      call: {OpenApiMeilisearch.Settings, :deletedisplayed_attributes},
      url: "/indexes/#{indexUid}/settings/displayed-attributes",
      body: body,
      method: :delete,
      request: [{"application/json", [:string]}],
      response: [
        {200, {OpenApiMeilisearch.SummarizedTaskView, :t}},
        {401, {OpenApiMeilisearch.ResponseError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Reset distinctAttribute

  Reset an index's distinctAttribute to its default value

  ## Request Body

  **Content Types**: `text/plain`
  """
  @spec deletedistinct_attribute(indexUid :: String.t(), body :: String.t(), opts :: keyword) ::
          {:ok, OpenApiMeilisearch.SummarizedTaskView.t()}
          | {:error, OpenApiMeilisearch.ResponseError.t()}
  def deletedistinct_attribute(indexUid, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [indexUid: indexUid, body: body],
      call: {OpenApiMeilisearch.Settings, :deletedistinct_attribute},
      url: "/indexes/#{indexUid}/settings/distinct-attribute",
      body: body,
      method: :delete,
      request: [{"text/plain", :string}],
      response: [
        {200, {OpenApiMeilisearch.SummarizedTaskView, :t}},
        {401, {OpenApiMeilisearch.ResponseError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Reset embedders

  Reset an index's embedders to its default value

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec deleteembedders(indexUid :: String.t(), body :: map, opts :: keyword) ::
          {:ok, OpenApiMeilisearch.SummarizedTaskView.t()}
          | {:error, OpenApiMeilisearch.ResponseError.t()}
  def deleteembedders(indexUid, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [indexUid: indexUid, body: body],
      call: {OpenApiMeilisearch.Settings, :deleteembedders},
      url: "/indexes/#{indexUid}/settings/embedders",
      body: body,
      method: :delete,
      request: [{"application/json", :map}],
      response: [
        {200, {OpenApiMeilisearch.SummarizedTaskView, :t}},
        {401, {OpenApiMeilisearch.ResponseError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Reset facetSearch

  Reset an index's facetSearch to its default value

  ## Request Body

  **Content Types**: `text/plain`
  """
  @spec deletefacet_search(indexUid :: String.t(), body :: boolean, opts :: keyword) ::
          {:ok, OpenApiMeilisearch.SummarizedTaskView.t()}
          | {:error, OpenApiMeilisearch.ResponseError.t()}
  def deletefacet_search(indexUid, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [indexUid: indexUid, body: body],
      call: {OpenApiMeilisearch.Settings, :deletefacet_search},
      url: "/indexes/#{indexUid}/settings/facet-search",
      body: body,
      method: :delete,
      request: [{"text/plain", :boolean}],
      response: [
        {200, {OpenApiMeilisearch.SummarizedTaskView, :t}},
        {401, {OpenApiMeilisearch.ResponseError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Reset faceting

  Reset an index's faceting to its default value

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec deletefaceting(
          indexUid :: String.t(),
          body :: OpenApiMeilisearch.FacetingSettings.t(),
          opts :: keyword
        ) ::
          {:ok, OpenApiMeilisearch.SummarizedTaskView.t()}
          | {:error, OpenApiMeilisearch.ResponseError.t()}
  def deletefaceting(indexUid, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [indexUid: indexUid, body: body],
      call: {OpenApiMeilisearch.Settings, :deletefaceting},
      url: "/indexes/#{indexUid}/settings/faceting",
      body: body,
      method: :delete,
      request: [{"application/json", {OpenApiMeilisearch.FacetingSettings, :t}}],
      response: [
        {200, {OpenApiMeilisearch.SummarizedTaskView, :t}},
        {401, {OpenApiMeilisearch.ResponseError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Reset filterableAttributes

  Reset an index's filterableAttributes to its default value

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec deletefilterable_attributes(
          indexUid :: String.t(),
          body :: [OpenApiMeilisearch.FilterableAttributesPatterns.t() | String.t()],
          opts :: keyword
        ) ::
          {:ok, OpenApiMeilisearch.SummarizedTaskView.t()}
          | {:error, OpenApiMeilisearch.ResponseError.t()}
  def deletefilterable_attributes(indexUid, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [indexUid: indexUid, body: body],
      call: {OpenApiMeilisearch.Settings, :deletefilterable_attributes},
      url: "/indexes/#{indexUid}/settings/filterable-attributes",
      body: body,
      method: :delete,
      request: [
        {"application/json",
         [union: [:string, {OpenApiMeilisearch.FilterableAttributesPatterns, :t}]]}
      ],
      response: [
        {200, {OpenApiMeilisearch.SummarizedTaskView, :t}},
        {401, {OpenApiMeilisearch.ResponseError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Reset localizedAttributes

  Reset an index's localizedAttributes to its default value

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec deletelocalized_attributes(
          indexUid :: String.t(),
          body :: [OpenApiMeilisearch.LocalizedAttributesRuleView.t()],
          opts :: keyword
        ) ::
          {:ok, OpenApiMeilisearch.SummarizedTaskView.t()}
          | {:error, OpenApiMeilisearch.ResponseError.t()}
  def deletelocalized_attributes(indexUid, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [indexUid: indexUid, body: body],
      call: {OpenApiMeilisearch.Settings, :deletelocalized_attributes},
      url: "/indexes/#{indexUid}/settings/localized-attributes",
      body: body,
      method: :delete,
      request: [{"application/json", [{OpenApiMeilisearch.LocalizedAttributesRuleView, :t}]}],
      response: [
        {200, {OpenApiMeilisearch.SummarizedTaskView, :t}},
        {401, {OpenApiMeilisearch.ResponseError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Reset nonSeparatorTokens

  Reset an index's nonSeparatorTokens to its default value

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec deletenon_separator_tokens(indexUid :: String.t(), body :: [String.t()], opts :: keyword) ::
          {:ok, OpenApiMeilisearch.SummarizedTaskView.t()}
          | {:error, OpenApiMeilisearch.ResponseError.t()}
  def deletenon_separator_tokens(indexUid, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [indexUid: indexUid, body: body],
      call: {OpenApiMeilisearch.Settings, :deletenon_separator_tokens},
      url: "/indexes/#{indexUid}/settings/non-separator-tokens",
      body: body,
      method: :delete,
      request: [{"application/json", [:string]}],
      response: [
        {200, {OpenApiMeilisearch.SummarizedTaskView, :t}},
        {401, {OpenApiMeilisearch.ResponseError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Reset pagination

  Reset an index's pagination to its default value

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec deletepagination(
          indexUid :: String.t(),
          body :: OpenApiMeilisearch.PaginationSettings.t(),
          opts :: keyword
        ) ::
          {:ok, OpenApiMeilisearch.SummarizedTaskView.t()}
          | {:error, OpenApiMeilisearch.ResponseError.t()}
  def deletepagination(indexUid, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [indexUid: indexUid, body: body],
      call: {OpenApiMeilisearch.Settings, :deletepagination},
      url: "/indexes/#{indexUid}/settings/pagination",
      body: body,
      method: :delete,
      request: [{"application/json", {OpenApiMeilisearch.PaginationSettings, :t}}],
      response: [
        {200, {OpenApiMeilisearch.SummarizedTaskView, :t}},
        {401, {OpenApiMeilisearch.ResponseError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Reset prefixSearch

  Reset an index's prefixSearch to its default value

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec deleteprefix_search(indexUid :: String.t(), body :: String.t(), opts :: keyword) ::
          {:ok, OpenApiMeilisearch.SummarizedTaskView.t()}
          | {:error, OpenApiMeilisearch.ResponseError.t()}
  def deleteprefix_search(indexUid, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [indexUid: indexUid, body: body],
      call: {OpenApiMeilisearch.Settings, :deleteprefix_search},
      url: "/indexes/#{indexUid}/settings/prefix-search",
      body: body,
      method: :delete,
      request: [{"application/json", {:enum, ["indexingTime", "disabled"]}}],
      response: [
        {200, {OpenApiMeilisearch.SummarizedTaskView, :t}},
        {401, {OpenApiMeilisearch.ResponseError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Reset proximityPrecision

  Reset an index's proximityPrecision to its default value

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec deleteproximity_precision(indexUid :: String.t(), body :: String.t(), opts :: keyword) ::
          {:ok, OpenApiMeilisearch.SummarizedTaskView.t()}
          | {:error, OpenApiMeilisearch.ResponseError.t()}
  def deleteproximity_precision(indexUid, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [indexUid: indexUid, body: body],
      call: {OpenApiMeilisearch.Settings, :deleteproximity_precision},
      url: "/indexes/#{indexUid}/settings/proximity-precision",
      body: body,
      method: :delete,
      request: [{"application/json", {:enum, ["byWord", "byAttribute"]}}],
      response: [
        {200, {OpenApiMeilisearch.SummarizedTaskView, :t}},
        {401, {OpenApiMeilisearch.ResponseError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Reset rankingRules

  Reset an index's rankingRules to its default value

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec deleteranking_rules(indexUid :: String.t(), body :: [map | String.t()], opts :: keyword) ::
          {:ok, OpenApiMeilisearch.SummarizedTaskView.t()}
          | {:error, OpenApiMeilisearch.ResponseError.t()}
  def deleteranking_rules(indexUid, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [indexUid: indexUid, body: body],
      call: {OpenApiMeilisearch.Settings, :deleteranking_rules},
      url: "/indexes/#{indexUid}/settings/ranking-rules",
      body: body,
      method: :delete,
      request: [
        {"application/json",
         [
           union: [
             :map,
             const: "Attribute",
             const: "Exactness",
             const: "Proximity",
             const: "Sort",
             const: "Typo",
             const: "Words"
           ]
         ]}
      ],
      response: [
        {200, {OpenApiMeilisearch.SummarizedTaskView, :t}},
        {401, {OpenApiMeilisearch.ResponseError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Reset searchCutoffMs

  Reset an index's searchCutoffMs to its default value

  ## Request Body

  **Content Types**: `text/plain`
  """
  @spec deletesearch_cutoff_ms(indexUid :: String.t(), body :: integer, opts :: keyword) ::
          {:ok, OpenApiMeilisearch.SummarizedTaskView.t()}
          | {:error, OpenApiMeilisearch.ResponseError.t()}
  def deletesearch_cutoff_ms(indexUid, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [indexUid: indexUid, body: body],
      call: {OpenApiMeilisearch.Settings, :deletesearch_cutoff_ms},
      url: "/indexes/#{indexUid}/settings/search-cutoff-ms",
      body: body,
      method: :delete,
      request: [{"text/plain", {:integer, "u-int64"}}],
      response: [
        {200, {OpenApiMeilisearch.SummarizedTaskView, :t}},
        {401, {OpenApiMeilisearch.ResponseError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Reset searchableAttributes

  Reset an index's searchableAttributes to its default value

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec deletesearchable_attributes(indexUid :: String.t(), body :: [String.t()], opts :: keyword) ::
          {:ok, OpenApiMeilisearch.SummarizedTaskView.t()}
          | {:error, OpenApiMeilisearch.ResponseError.t()}
  def deletesearchable_attributes(indexUid, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [indexUid: indexUid, body: body],
      call: {OpenApiMeilisearch.Settings, :deletesearchable_attributes},
      url: "/indexes/#{indexUid}/settings/searchable-attributes",
      body: body,
      method: :delete,
      request: [{"application/json", [:string]}],
      response: [
        {200, {OpenApiMeilisearch.SummarizedTaskView, :t}},
        {401, {OpenApiMeilisearch.ResponseError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Reset separatorTokens

  Reset an index's separatorTokens to its default value

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec deleteseparator_tokens(indexUid :: String.t(), body :: [String.t()], opts :: keyword) ::
          {:ok, OpenApiMeilisearch.SummarizedTaskView.t()}
          | {:error, OpenApiMeilisearch.ResponseError.t()}
  def deleteseparator_tokens(indexUid, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [indexUid: indexUid, body: body],
      call: {OpenApiMeilisearch.Settings, :deleteseparator_tokens},
      url: "/indexes/#{indexUid}/settings/separator-tokens",
      body: body,
      method: :delete,
      request: [{"application/json", [:string]}],
      response: [
        {200, {OpenApiMeilisearch.SummarizedTaskView, :t}},
        {401, {OpenApiMeilisearch.ResponseError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Reset sortableAttributes

  Reset an index's sortableAttributes to its default value

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec deletesortable_attributes(indexUid :: String.t(), body :: [String.t()], opts :: keyword) ::
          {:ok, OpenApiMeilisearch.SummarizedTaskView.t()}
          | {:error, OpenApiMeilisearch.ResponseError.t()}
  def deletesortable_attributes(indexUid, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [indexUid: indexUid, body: body],
      call: {OpenApiMeilisearch.Settings, :deletesortable_attributes},
      url: "/indexes/#{indexUid}/settings/sortable-attributes",
      body: body,
      method: :delete,
      request: [{"application/json", [:string]}],
      response: [
        {200, {OpenApiMeilisearch.SummarizedTaskView, :t}},
        {401, {OpenApiMeilisearch.ResponseError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Reset stopWords

  Reset an index's stopWords to its default value

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec deletestop_words(indexUid :: String.t(), body :: [String.t()], opts :: keyword) ::
          {:ok, OpenApiMeilisearch.SummarizedTaskView.t()}
          | {:error, OpenApiMeilisearch.ResponseError.t()}
  def deletestop_words(indexUid, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [indexUid: indexUid, body: body],
      call: {OpenApiMeilisearch.Settings, :deletestop_words},
      url: "/indexes/#{indexUid}/settings/stop-words",
      body: body,
      method: :delete,
      request: [{"application/json", [:string]}],
      response: [
        {200, {OpenApiMeilisearch.SummarizedTaskView, :t}},
        {401, {OpenApiMeilisearch.ResponseError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Reset synonyms

  Reset an index's synonyms to its default value

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec deletesynonyms(indexUid :: String.t(), body :: map, opts :: keyword) ::
          {:ok, OpenApiMeilisearch.SummarizedTaskView.t()}
          | {:error, OpenApiMeilisearch.ResponseError.t()}
  def deletesynonyms(indexUid, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [indexUid: indexUid, body: body],
      call: {OpenApiMeilisearch.Settings, :deletesynonyms},
      url: "/indexes/#{indexUid}/settings/synonyms",
      body: body,
      method: :delete,
      request: [{"application/json", :map}],
      response: [
        {200, {OpenApiMeilisearch.SummarizedTaskView, :t}},
        {401, {OpenApiMeilisearch.ResponseError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Reset typoTolerance

  Reset an index's typoTolerance to its default value

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec deletetypo_tolerance(
          indexUid :: String.t(),
          body :: OpenApiMeilisearch.TypoSettings.t(),
          opts :: keyword
        ) ::
          {:ok, OpenApiMeilisearch.SummarizedTaskView.t()}
          | {:error, OpenApiMeilisearch.ResponseError.t()}
  def deletetypo_tolerance(indexUid, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [indexUid: indexUid, body: body],
      call: {OpenApiMeilisearch.Settings, :deletetypo_tolerance},
      url: "/indexes/#{indexUid}/settings/typo-tolerance",
      body: body,
      method: :delete,
      request: [{"application/json", {OpenApiMeilisearch.TypoSettings, :t}}],
      response: [
        {200, {OpenApiMeilisearch.SummarizedTaskView, :t}},
        {401, {OpenApiMeilisearch.ResponseError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  All settings

  This route allows you to retrieve, configure, or reset all of an index's settings at once.
  """
  @spec get_all(indexUid :: String.t(), opts :: keyword) ::
          {:ok, OpenApiMeilisearch.SettingsUnchecked.t()}
          | {:error, OpenApiMeilisearch.ResponseError.t()}
  def get_all(indexUid, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [indexUid: indexUid],
      call: {OpenApiMeilisearch.Settings, :get_all},
      url: "/indexes/#{indexUid}/settings",
      method: :get,
      response: [
        {200, {OpenApiMeilisearch.SettingsUnchecked, :t}},
        {401, {OpenApiMeilisearch.ResponseError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Get chat

  Get an user defined chat
  """
  @spec getchat(indexUid :: String.t(), opts :: keyword) ::
          {:ok, OpenApiMeilisearch.ChatSettings.t()}
          | {:error, OpenApiMeilisearch.ResponseError.t()}
  def getchat(indexUid, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [indexUid: indexUid],
      call: {OpenApiMeilisearch.Settings, :getchat},
      url: "/indexes/#{indexUid}/settings/chat",
      method: :get,
      response: [
        {200, {OpenApiMeilisearch.ChatSettings, :t}},
        {401, {OpenApiMeilisearch.ResponseError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Get dictionary

  Get an user defined dictionary
  """
  @spec getdictionary(indexUid :: String.t(), opts :: keyword) ::
          {:ok, [String.t()]} | {:error, OpenApiMeilisearch.ResponseError.t()}
  def getdictionary(indexUid, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [indexUid: indexUid],
      call: {OpenApiMeilisearch.Settings, :getdictionary},
      url: "/indexes/#{indexUid}/settings/dictionary",
      method: :get,
      response: [{200, [:string]}, {401, {OpenApiMeilisearch.ResponseError, :t}}],
      opts: opts
    })
  end

  @doc """
  Get displayedAttributes

  Get an user defined displayedAttributes
  """
  @spec getdisplayed_attributes(indexUid :: String.t(), opts :: keyword) ::
          {:ok, [String.t()]} | {:error, OpenApiMeilisearch.ResponseError.t()}
  def getdisplayed_attributes(indexUid, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [indexUid: indexUid],
      call: {OpenApiMeilisearch.Settings, :getdisplayed_attributes},
      url: "/indexes/#{indexUid}/settings/displayed-attributes",
      method: :get,
      response: [{200, [:string]}, {401, {OpenApiMeilisearch.ResponseError, :t}}],
      opts: opts
    })
  end

  @doc """
  Get distinctAttribute

  Get an user defined distinctAttribute
  """
  @spec getdistinct_attribute(indexUid :: String.t(), opts :: keyword) ::
          {:ok, String.t()} | {:error, OpenApiMeilisearch.ResponseError.t()}
  def getdistinct_attribute(indexUid, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [indexUid: indexUid],
      call: {OpenApiMeilisearch.Settings, :getdistinct_attribute},
      url: "/indexes/#{indexUid}/settings/distinct-attribute",
      method: :get,
      response: [{200, :string}, {401, {OpenApiMeilisearch.ResponseError, :t}}],
      opts: opts
    })
  end

  @doc """
  Get embedders

  Get an user defined embedders
  """
  @spec getembedders(indexUid :: String.t(), opts :: keyword) ::
          {:ok, map} | {:error, OpenApiMeilisearch.ResponseError.t()}
  def getembedders(indexUid, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [indexUid: indexUid],
      call: {OpenApiMeilisearch.Settings, :getembedders},
      url: "/indexes/#{indexUid}/settings/embedders",
      method: :get,
      response: [{200, :map}, {401, {OpenApiMeilisearch.ResponseError, :t}}],
      opts: opts
    })
  end

  @doc """
  Get facetSearch

  Get an user defined facetSearch
  """
  @spec getfacet_search(indexUid :: String.t(), opts :: keyword) ::
          {:ok, boolean} | {:error, OpenApiMeilisearch.ResponseError.t()}
  def getfacet_search(indexUid, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [indexUid: indexUid],
      call: {OpenApiMeilisearch.Settings, :getfacet_search},
      url: "/indexes/#{indexUid}/settings/facet-search",
      method: :get,
      response: [{200, :boolean}, {401, {OpenApiMeilisearch.ResponseError, :t}}],
      opts: opts
    })
  end

  @doc """
  Get faceting

  Get an user defined faceting
  """
  @spec getfaceting(indexUid :: String.t(), opts :: keyword) ::
          {:ok, OpenApiMeilisearch.FacetingSettings.t()}
          | {:error, OpenApiMeilisearch.ResponseError.t()}
  def getfaceting(indexUid, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [indexUid: indexUid],
      call: {OpenApiMeilisearch.Settings, :getfaceting},
      url: "/indexes/#{indexUid}/settings/faceting",
      method: :get,
      response: [
        {200, {OpenApiMeilisearch.FacetingSettings, :t}},
        {401, {OpenApiMeilisearch.ResponseError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Get filterableAttributes

  Get an user defined filterableAttributes
  """
  @spec getfilterable_attributes(indexUid :: String.t(), opts :: keyword) ::
          {:ok, [OpenApiMeilisearch.FilterableAttributesPatterns.t() | String.t()]}
          | {:error, OpenApiMeilisearch.ResponseError.t()}
  def getfilterable_attributes(indexUid, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [indexUid: indexUid],
      call: {OpenApiMeilisearch.Settings, :getfilterable_attributes},
      url: "/indexes/#{indexUid}/settings/filterable-attributes",
      method: :get,
      response: [
        {200, [union: [:string, {OpenApiMeilisearch.FilterableAttributesPatterns, :t}]]},
        {401, {OpenApiMeilisearch.ResponseError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Get localizedAttributes

  Get an user defined localizedAttributes
  """
  @spec getlocalized_attributes(indexUid :: String.t(), opts :: keyword) ::
          {:ok, [OpenApiMeilisearch.LocalizedAttributesRuleView.t()]}
          | {:error, OpenApiMeilisearch.ResponseError.t()}
  def getlocalized_attributes(indexUid, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [indexUid: indexUid],
      call: {OpenApiMeilisearch.Settings, :getlocalized_attributes},
      url: "/indexes/#{indexUid}/settings/localized-attributes",
      method: :get,
      response: [
        {200, [{OpenApiMeilisearch.LocalizedAttributesRuleView, :t}]},
        {401, {OpenApiMeilisearch.ResponseError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Get nonSeparatorTokens

  Get an user defined nonSeparatorTokens
  """
  @spec getnon_separator_tokens(indexUid :: String.t(), opts :: keyword) ::
          {:ok, [String.t()]} | {:error, OpenApiMeilisearch.ResponseError.t()}
  def getnon_separator_tokens(indexUid, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [indexUid: indexUid],
      call: {OpenApiMeilisearch.Settings, :getnon_separator_tokens},
      url: "/indexes/#{indexUid}/settings/non-separator-tokens",
      method: :get,
      response: [{200, [:string]}, {401, {OpenApiMeilisearch.ResponseError, :t}}],
      opts: opts
    })
  end

  @doc """
  Get pagination

  Get an user defined pagination
  """
  @spec getpagination(indexUid :: String.t(), opts :: keyword) ::
          {:ok, OpenApiMeilisearch.PaginationSettings.t()}
          | {:error, OpenApiMeilisearch.ResponseError.t()}
  def getpagination(indexUid, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [indexUid: indexUid],
      call: {OpenApiMeilisearch.Settings, :getpagination},
      url: "/indexes/#{indexUid}/settings/pagination",
      method: :get,
      response: [
        {200, {OpenApiMeilisearch.PaginationSettings, :t}},
        {401, {OpenApiMeilisearch.ResponseError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Get prefixSearch

  Get an user defined prefixSearch
  """
  @spec getprefix_search(indexUid :: String.t(), opts :: keyword) ::
          {:ok, String.t()} | {:error, OpenApiMeilisearch.ResponseError.t()}
  def getprefix_search(indexUid, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [indexUid: indexUid],
      call: {OpenApiMeilisearch.Settings, :getprefix_search},
      url: "/indexes/#{indexUid}/settings/prefix-search",
      method: :get,
      response: [
        {200, {:enum, ["indexingTime", "disabled"]}},
        {401, {OpenApiMeilisearch.ResponseError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Get proximityPrecision

  Get an user defined proximityPrecision
  """
  @spec getproximity_precision(indexUid :: String.t(), opts :: keyword) ::
          {:ok, String.t()} | {:error, OpenApiMeilisearch.ResponseError.t()}
  def getproximity_precision(indexUid, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [indexUid: indexUid],
      call: {OpenApiMeilisearch.Settings, :getproximity_precision},
      url: "/indexes/#{indexUid}/settings/proximity-precision",
      method: :get,
      response: [
        {200, {:enum, ["byWord", "byAttribute"]}},
        {401, {OpenApiMeilisearch.ResponseError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Get rankingRules

  Get an user defined rankingRules
  """
  @spec getranking_rules(indexUid :: String.t(), opts :: keyword) ::
          {:ok, [map | String.t()]} | {:error, OpenApiMeilisearch.ResponseError.t()}
  def getranking_rules(indexUid, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [indexUid: indexUid],
      call: {OpenApiMeilisearch.Settings, :getranking_rules},
      url: "/indexes/#{indexUid}/settings/ranking-rules",
      method: :get,
      response: [
        {200,
         [
           union: [
             :map,
             const: "Attribute",
             const: "Exactness",
             const: "Proximity",
             const: "Sort",
             const: "Typo",
             const: "Words"
           ]
         ]},
        {401, {OpenApiMeilisearch.ResponseError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Get searchCutoffMs

  Get an user defined searchCutoffMs
  """
  @spec getsearch_cutoff_ms(indexUid :: String.t(), opts :: keyword) ::
          {:ok, integer} | {:error, OpenApiMeilisearch.ResponseError.t()}
  def getsearch_cutoff_ms(indexUid, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [indexUid: indexUid],
      call: {OpenApiMeilisearch.Settings, :getsearch_cutoff_ms},
      url: "/indexes/#{indexUid}/settings/search-cutoff-ms",
      method: :get,
      response: [{200, {:integer, "u-int64"}}, {401, {OpenApiMeilisearch.ResponseError, :t}}],
      opts: opts
    })
  end

  @doc """
  Get searchableAttributes

  Get an user defined searchableAttributes
  """
  @spec getsearchable_attributes(indexUid :: String.t(), opts :: keyword) ::
          {:ok, [String.t()]} | {:error, OpenApiMeilisearch.ResponseError.t()}
  def getsearchable_attributes(indexUid, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [indexUid: indexUid],
      call: {OpenApiMeilisearch.Settings, :getsearchable_attributes},
      url: "/indexes/#{indexUid}/settings/searchable-attributes",
      method: :get,
      response: [{200, [:string]}, {401, {OpenApiMeilisearch.ResponseError, :t}}],
      opts: opts
    })
  end

  @doc """
  Get separatorTokens

  Get an user defined separatorTokens
  """
  @spec getseparator_tokens(indexUid :: String.t(), opts :: keyword) ::
          {:ok, [String.t()]} | {:error, OpenApiMeilisearch.ResponseError.t()}
  def getseparator_tokens(indexUid, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [indexUid: indexUid],
      call: {OpenApiMeilisearch.Settings, :getseparator_tokens},
      url: "/indexes/#{indexUid}/settings/separator-tokens",
      method: :get,
      response: [{200, [:string]}, {401, {OpenApiMeilisearch.ResponseError, :t}}],
      opts: opts
    })
  end

  @doc """
  Get sortableAttributes

  Get an user defined sortableAttributes
  """
  @spec getsortable_attributes(indexUid :: String.t(), opts :: keyword) ::
          {:ok, [String.t()]} | {:error, OpenApiMeilisearch.ResponseError.t()}
  def getsortable_attributes(indexUid, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [indexUid: indexUid],
      call: {OpenApiMeilisearch.Settings, :getsortable_attributes},
      url: "/indexes/#{indexUid}/settings/sortable-attributes",
      method: :get,
      response: [{200, [:string]}, {401, {OpenApiMeilisearch.ResponseError, :t}}],
      opts: opts
    })
  end

  @doc """
  Get stopWords

  Get an user defined stopWords
  """
  @spec getstop_words(indexUid :: String.t(), opts :: keyword) ::
          {:ok, [String.t()]} | {:error, OpenApiMeilisearch.ResponseError.t()}
  def getstop_words(indexUid, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [indexUid: indexUid],
      call: {OpenApiMeilisearch.Settings, :getstop_words},
      url: "/indexes/#{indexUid}/settings/stop-words",
      method: :get,
      response: [{200, [:string]}, {401, {OpenApiMeilisearch.ResponseError, :t}}],
      opts: opts
    })
  end

  @doc """
  Get synonyms

  Get an user defined synonyms
  """
  @spec getsynonyms(indexUid :: String.t(), opts :: keyword) ::
          {:ok, map} | {:error, OpenApiMeilisearch.ResponseError.t()}
  def getsynonyms(indexUid, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [indexUid: indexUid],
      call: {OpenApiMeilisearch.Settings, :getsynonyms},
      url: "/indexes/#{indexUid}/settings/synonyms",
      method: :get,
      response: [{200, :map}, {401, {OpenApiMeilisearch.ResponseError, :t}}],
      opts: opts
    })
  end

  @doc """
  Get typoTolerance

  Get an user defined typoTolerance
  """
  @spec gettypo_tolerance(indexUid :: String.t(), opts :: keyword) ::
          {:ok, OpenApiMeilisearch.TypoSettings.t()}
          | {:error, OpenApiMeilisearch.ResponseError.t()}
  def gettypo_tolerance(indexUid, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [indexUid: indexUid],
      call: {OpenApiMeilisearch.Settings, :gettypo_tolerance},
      url: "/indexes/#{indexUid}/settings/typo-tolerance",
      method: :get,
      response: [
        {200, {OpenApiMeilisearch.TypoSettings, :t}},
        {401, {OpenApiMeilisearch.ResponseError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Update embedders

  Update an index's user defined embedders

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec patchembedders(indexUid :: String.t(), body :: map, opts :: keyword) ::
          {:ok, OpenApiMeilisearch.SummarizedTaskView.t()}
          | {:error, OpenApiMeilisearch.ResponseError.t()}
  def patchembedders(indexUid, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [indexUid: indexUid, body: body],
      call: {OpenApiMeilisearch.Settings, :patchembedders},
      url: "/indexes/#{indexUid}/settings/embedders",
      body: body,
      method: :patch,
      request: [{"application/json", :map}],
      response: [
        {200, {OpenApiMeilisearch.SummarizedTaskView, :t}},
        {401, {OpenApiMeilisearch.ResponseError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Update faceting

  Update an index's user defined faceting

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec patchfaceting(
          indexUid :: String.t(),
          body :: OpenApiMeilisearch.FacetingSettings.t(),
          opts :: keyword
        ) ::
          {:ok, OpenApiMeilisearch.SummarizedTaskView.t()}
          | {:error, OpenApiMeilisearch.ResponseError.t()}
  def patchfaceting(indexUid, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [indexUid: indexUid, body: body],
      call: {OpenApiMeilisearch.Settings, :patchfaceting},
      url: "/indexes/#{indexUid}/settings/faceting",
      body: body,
      method: :patch,
      request: [{"application/json", {OpenApiMeilisearch.FacetingSettings, :t}}],
      response: [
        {200, {OpenApiMeilisearch.SummarizedTaskView, :t}},
        {401, {OpenApiMeilisearch.ResponseError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Update pagination

  Update an index's user defined pagination

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec patchpagination(
          indexUid :: String.t(),
          body :: OpenApiMeilisearch.PaginationSettings.t(),
          opts :: keyword
        ) ::
          {:ok, OpenApiMeilisearch.SummarizedTaskView.t()}
          | {:error, OpenApiMeilisearch.ResponseError.t()}
  def patchpagination(indexUid, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [indexUid: indexUid, body: body],
      call: {OpenApiMeilisearch.Settings, :patchpagination},
      url: "/indexes/#{indexUid}/settings/pagination",
      body: body,
      method: :patch,
      request: [{"application/json", {OpenApiMeilisearch.PaginationSettings, :t}}],
      response: [
        {200, {OpenApiMeilisearch.SummarizedTaskView, :t}},
        {401, {OpenApiMeilisearch.ResponseError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Update typoTolerance

  Update an index's user defined typoTolerance

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec patchtypo_tolerance(
          indexUid :: String.t(),
          body :: OpenApiMeilisearch.TypoSettings.t(),
          opts :: keyword
        ) ::
          {:ok, OpenApiMeilisearch.SummarizedTaskView.t()}
          | {:error, OpenApiMeilisearch.ResponseError.t()}
  def patchtypo_tolerance(indexUid, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [indexUid: indexUid, body: body],
      call: {OpenApiMeilisearch.Settings, :patchtypo_tolerance},
      url: "/indexes/#{indexUid}/settings/typo-tolerance",
      body: body,
      method: :patch,
      request: [{"application/json", {OpenApiMeilisearch.TypoSettings, :t}}],
      response: [
        {200, {OpenApiMeilisearch.SummarizedTaskView, :t}},
        {401, {OpenApiMeilisearch.ResponseError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Update chat

  Update an index's user defined chat

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec putchat(
          indexUid :: String.t(),
          body :: OpenApiMeilisearch.ChatSettings.t(),
          opts :: keyword
        ) ::
          {:ok, OpenApiMeilisearch.SummarizedTaskView.t()}
          | {:error, OpenApiMeilisearch.ResponseError.t()}
  def putchat(indexUid, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [indexUid: indexUid, body: body],
      call: {OpenApiMeilisearch.Settings, :putchat},
      url: "/indexes/#{indexUid}/settings/chat",
      body: body,
      method: :put,
      request: [{"application/json", {OpenApiMeilisearch.ChatSettings, :t}}],
      response: [
        {200, {OpenApiMeilisearch.SummarizedTaskView, :t}},
        {401, {OpenApiMeilisearch.ResponseError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Update dictionary

  Update an index's user defined dictionary

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec putdictionary(indexUid :: String.t(), body :: [String.t()], opts :: keyword) ::
          {:ok, OpenApiMeilisearch.SummarizedTaskView.t()}
          | {:error, OpenApiMeilisearch.ResponseError.t()}
  def putdictionary(indexUid, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [indexUid: indexUid, body: body],
      call: {OpenApiMeilisearch.Settings, :putdictionary},
      url: "/indexes/#{indexUid}/settings/dictionary",
      body: body,
      method: :put,
      request: [{"application/json", [:string]}],
      response: [
        {200, {OpenApiMeilisearch.SummarizedTaskView, :t}},
        {401, {OpenApiMeilisearch.ResponseError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Update displayedAttributes

  Update an index's user defined displayedAttributes

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec putdisplayed_attributes(indexUid :: String.t(), body :: [String.t()], opts :: keyword) ::
          {:ok, OpenApiMeilisearch.SummarizedTaskView.t()}
          | {:error, OpenApiMeilisearch.ResponseError.t()}
  def putdisplayed_attributes(indexUid, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [indexUid: indexUid, body: body],
      call: {OpenApiMeilisearch.Settings, :putdisplayed_attributes},
      url: "/indexes/#{indexUid}/settings/displayed-attributes",
      body: body,
      method: :put,
      request: [{"application/json", [:string]}],
      response: [
        {200, {OpenApiMeilisearch.SummarizedTaskView, :t}},
        {401, {OpenApiMeilisearch.ResponseError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Update distinctAttribute

  Update an index's user defined distinctAttribute

  ## Request Body

  **Content Types**: `text/plain`
  """
  @spec putdistinct_attribute(indexUid :: String.t(), body :: String.t(), opts :: keyword) ::
          {:ok, OpenApiMeilisearch.SummarizedTaskView.t()}
          | {:error, OpenApiMeilisearch.ResponseError.t()}
  def putdistinct_attribute(indexUid, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [indexUid: indexUid, body: body],
      call: {OpenApiMeilisearch.Settings, :putdistinct_attribute},
      url: "/indexes/#{indexUid}/settings/distinct-attribute",
      body: body,
      method: :put,
      request: [{"text/plain", :string}],
      response: [
        {200, {OpenApiMeilisearch.SummarizedTaskView, :t}},
        {401, {OpenApiMeilisearch.ResponseError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Update facetSearch

  Update an index's user defined facetSearch

  ## Request Body

  **Content Types**: `text/plain`
  """
  @spec putfacet_search(indexUid :: String.t(), body :: boolean, opts :: keyword) ::
          {:ok, OpenApiMeilisearch.SummarizedTaskView.t()}
          | {:error, OpenApiMeilisearch.ResponseError.t()}
  def putfacet_search(indexUid, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [indexUid: indexUid, body: body],
      call: {OpenApiMeilisearch.Settings, :putfacet_search},
      url: "/indexes/#{indexUid}/settings/facet-search",
      body: body,
      method: :put,
      request: [{"text/plain", :boolean}],
      response: [
        {200, {OpenApiMeilisearch.SummarizedTaskView, :t}},
        {401, {OpenApiMeilisearch.ResponseError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Update filterableAttributes

  Update an index's user defined filterableAttributes

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec putfilterable_attributes(
          indexUid :: String.t(),
          body :: [OpenApiMeilisearch.FilterableAttributesPatterns.t() | String.t()],
          opts :: keyword
        ) ::
          {:ok, OpenApiMeilisearch.SummarizedTaskView.t()}
          | {:error, OpenApiMeilisearch.ResponseError.t()}
  def putfilterable_attributes(indexUid, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [indexUid: indexUid, body: body],
      call: {OpenApiMeilisearch.Settings, :putfilterable_attributes},
      url: "/indexes/#{indexUid}/settings/filterable-attributes",
      body: body,
      method: :put,
      request: [
        {"application/json",
         [union: [:string, {OpenApiMeilisearch.FilterableAttributesPatterns, :t}]]}
      ],
      response: [
        {200, {OpenApiMeilisearch.SummarizedTaskView, :t}},
        {401, {OpenApiMeilisearch.ResponseError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Update localizedAttributes

  Update an index's user defined localizedAttributes

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec putlocalized_attributes(
          indexUid :: String.t(),
          body :: [OpenApiMeilisearch.LocalizedAttributesRuleView.t()],
          opts :: keyword
        ) ::
          {:ok, OpenApiMeilisearch.SummarizedTaskView.t()}
          | {:error, OpenApiMeilisearch.ResponseError.t()}
  def putlocalized_attributes(indexUid, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [indexUid: indexUid, body: body],
      call: {OpenApiMeilisearch.Settings, :putlocalized_attributes},
      url: "/indexes/#{indexUid}/settings/localized-attributes",
      body: body,
      method: :put,
      request: [{"application/json", [{OpenApiMeilisearch.LocalizedAttributesRuleView, :t}]}],
      response: [
        {200, {OpenApiMeilisearch.SummarizedTaskView, :t}},
        {401, {OpenApiMeilisearch.ResponseError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Update nonSeparatorTokens

  Update an index's user defined nonSeparatorTokens

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec putnon_separator_tokens(indexUid :: String.t(), body :: [String.t()], opts :: keyword) ::
          {:ok, OpenApiMeilisearch.SummarizedTaskView.t()}
          | {:error, OpenApiMeilisearch.ResponseError.t()}
  def putnon_separator_tokens(indexUid, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [indexUid: indexUid, body: body],
      call: {OpenApiMeilisearch.Settings, :putnon_separator_tokens},
      url: "/indexes/#{indexUid}/settings/non-separator-tokens",
      body: body,
      method: :put,
      request: [{"application/json", [:string]}],
      response: [
        {200, {OpenApiMeilisearch.SummarizedTaskView, :t}},
        {401, {OpenApiMeilisearch.ResponseError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Update prefixSearch

  Update an index's user defined prefixSearch

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec putprefix_search(indexUid :: String.t(), body :: String.t(), opts :: keyword) ::
          {:ok, OpenApiMeilisearch.SummarizedTaskView.t()}
          | {:error, OpenApiMeilisearch.ResponseError.t()}
  def putprefix_search(indexUid, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [indexUid: indexUid, body: body],
      call: {OpenApiMeilisearch.Settings, :putprefix_search},
      url: "/indexes/#{indexUid}/settings/prefix-search",
      body: body,
      method: :put,
      request: [{"application/json", {:enum, ["indexingTime", "disabled"]}}],
      response: [
        {200, {OpenApiMeilisearch.SummarizedTaskView, :t}},
        {401, {OpenApiMeilisearch.ResponseError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Update proximityPrecision

  Update an index's user defined proximityPrecision

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec putproximity_precision(indexUid :: String.t(), body :: String.t(), opts :: keyword) ::
          {:ok, OpenApiMeilisearch.SummarizedTaskView.t()}
          | {:error, OpenApiMeilisearch.ResponseError.t()}
  def putproximity_precision(indexUid, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [indexUid: indexUid, body: body],
      call: {OpenApiMeilisearch.Settings, :putproximity_precision},
      url: "/indexes/#{indexUid}/settings/proximity-precision",
      body: body,
      method: :put,
      request: [{"application/json", {:enum, ["byWord", "byAttribute"]}}],
      response: [
        {200, {OpenApiMeilisearch.SummarizedTaskView, :t}},
        {401, {OpenApiMeilisearch.ResponseError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Update rankingRules

  Update an index's user defined rankingRules

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec putranking_rules(indexUid :: String.t(), body :: [map | String.t()], opts :: keyword) ::
          {:ok, OpenApiMeilisearch.SummarizedTaskView.t()}
          | {:error, OpenApiMeilisearch.ResponseError.t()}
  def putranking_rules(indexUid, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [indexUid: indexUid, body: body],
      call: {OpenApiMeilisearch.Settings, :putranking_rules},
      url: "/indexes/#{indexUid}/settings/ranking-rules",
      body: body,
      method: :put,
      request: [
        {"application/json",
         [
           union: [
             :map,
             const: "Attribute",
             const: "Exactness",
             const: "Proximity",
             const: "Sort",
             const: "Typo",
             const: "Words"
           ]
         ]}
      ],
      response: [
        {200, {OpenApiMeilisearch.SummarizedTaskView, :t}},
        {401, {OpenApiMeilisearch.ResponseError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Update searchCutoffMs

  Update an index's user defined searchCutoffMs

  ## Request Body

  **Content Types**: `text/plain`
  """
  @spec putsearch_cutoff_ms(indexUid :: String.t(), body :: integer, opts :: keyword) ::
          {:ok, OpenApiMeilisearch.SummarizedTaskView.t()}
          | {:error, OpenApiMeilisearch.ResponseError.t()}
  def putsearch_cutoff_ms(indexUid, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [indexUid: indexUid, body: body],
      call: {OpenApiMeilisearch.Settings, :putsearch_cutoff_ms},
      url: "/indexes/#{indexUid}/settings/search-cutoff-ms",
      body: body,
      method: :put,
      request: [{"text/plain", {:integer, "u-int64"}}],
      response: [
        {200, {OpenApiMeilisearch.SummarizedTaskView, :t}},
        {401, {OpenApiMeilisearch.ResponseError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Update searchableAttributes

  Update an index's user defined searchableAttributes

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec putsearchable_attributes(indexUid :: String.t(), body :: [String.t()], opts :: keyword) ::
          {:ok, OpenApiMeilisearch.SummarizedTaskView.t()}
          | {:error, OpenApiMeilisearch.ResponseError.t()}
  def putsearchable_attributes(indexUid, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [indexUid: indexUid, body: body],
      call: {OpenApiMeilisearch.Settings, :putsearchable_attributes},
      url: "/indexes/#{indexUid}/settings/searchable-attributes",
      body: body,
      method: :put,
      request: [{"application/json", [:string]}],
      response: [
        {200, {OpenApiMeilisearch.SummarizedTaskView, :t}},
        {401, {OpenApiMeilisearch.ResponseError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Update separatorTokens

  Update an index's user defined separatorTokens

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec putseparator_tokens(indexUid :: String.t(), body :: [String.t()], opts :: keyword) ::
          {:ok, OpenApiMeilisearch.SummarizedTaskView.t()}
          | {:error, OpenApiMeilisearch.ResponseError.t()}
  def putseparator_tokens(indexUid, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [indexUid: indexUid, body: body],
      call: {OpenApiMeilisearch.Settings, :putseparator_tokens},
      url: "/indexes/#{indexUid}/settings/separator-tokens",
      body: body,
      method: :put,
      request: [{"application/json", [:string]}],
      response: [
        {200, {OpenApiMeilisearch.SummarizedTaskView, :t}},
        {401, {OpenApiMeilisearch.ResponseError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Update sortableAttributes

  Update an index's user defined sortableAttributes

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec putsortable_attributes(indexUid :: String.t(), body :: [String.t()], opts :: keyword) ::
          {:ok, OpenApiMeilisearch.SummarizedTaskView.t()}
          | {:error, OpenApiMeilisearch.ResponseError.t()}
  def putsortable_attributes(indexUid, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [indexUid: indexUid, body: body],
      call: {OpenApiMeilisearch.Settings, :putsortable_attributes},
      url: "/indexes/#{indexUid}/settings/sortable-attributes",
      body: body,
      method: :put,
      request: [{"application/json", [:string]}],
      response: [
        {200, {OpenApiMeilisearch.SummarizedTaskView, :t}},
        {401, {OpenApiMeilisearch.ResponseError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Update stopWords

  Update an index's user defined stopWords

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec putstop_words(indexUid :: String.t(), body :: [String.t()], opts :: keyword) ::
          {:ok, OpenApiMeilisearch.SummarizedTaskView.t()}
          | {:error, OpenApiMeilisearch.ResponseError.t()}
  def putstop_words(indexUid, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [indexUid: indexUid, body: body],
      call: {OpenApiMeilisearch.Settings, :putstop_words},
      url: "/indexes/#{indexUid}/settings/stop-words",
      body: body,
      method: :put,
      request: [{"application/json", [:string]}],
      response: [
        {200, {OpenApiMeilisearch.SummarizedTaskView, :t}},
        {401, {OpenApiMeilisearch.ResponseError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Update synonyms

  Update an index's user defined synonyms

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec putsynonyms(indexUid :: String.t(), body :: map, opts :: keyword) ::
          {:ok, OpenApiMeilisearch.SummarizedTaskView.t()}
          | {:error, OpenApiMeilisearch.ResponseError.t()}
  def putsynonyms(indexUid, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [indexUid: indexUid, body: body],
      call: {OpenApiMeilisearch.Settings, :putsynonyms},
      url: "/indexes/#{indexUid}/settings/synonyms",
      body: body,
      method: :put,
      request: [{"application/json", :map}],
      response: [
        {200, {OpenApiMeilisearch.SummarizedTaskView, :t}},
        {401, {OpenApiMeilisearch.ResponseError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Update settings

  Update the settings of an index.
  Passing null to an index setting will reset it to its default value.
  Updates in the settings route are partial. This means that any parameters not provided in the body will be left unchanged.
  If the provided index does not exist, it will be created.

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec update_all(
          indexUid :: String.t(),
          body :: OpenApiMeilisearch.SettingsUnchecked.t(),
          opts :: keyword
        ) ::
          {:ok, OpenApiMeilisearch.SummarizedTaskView.t()}
          | {:error, OpenApiMeilisearch.ResponseError.t()}
  def update_all(indexUid, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [indexUid: indexUid, body: body],
      call: {OpenApiMeilisearch.Settings, :update_all},
      url: "/indexes/#{indexUid}/settings",
      body: body,
      method: :patch,
      request: [{"application/json", {OpenApiMeilisearch.SettingsUnchecked, :t}}],
      response: [
        {200, {OpenApiMeilisearch.SummarizedTaskView, :t}},
        {401, {OpenApiMeilisearch.ResponseError, :t}}
      ],
      opts: opts
    })
  end
end
