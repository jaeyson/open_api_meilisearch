defmodule OpenApiMeilisearch.Dumps do
  @moduledoc """
  Provides API endpoint related to dumps
  """

  @default_client OpenApiMeilisearch.Client

  @doc """
  Create a dump

  Triggers a dump creation process. Once the process is complete, a dump is created in the
  [dump directory](https://www.meilisearch.com/docs/learn/self_hosted/configure_meilisearch_at_launch#dump-directory).
  If the dump directory does not exist yet, it will be created.
  """
  @spec create_dump(opts :: keyword) ::
          {:ok, OpenApiMeilisearch.SummarizedTaskView.t()}
          | {:error, OpenApiMeilisearch.ResponseError.t()}
  def create_dump(opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [],
      call: {OpenApiMeilisearch.Dumps, :create_dump},
      url: "/dumps",
      method: :post,
      response: [
        {202, {OpenApiMeilisearch.SummarizedTaskView, :t}},
        {401, {OpenApiMeilisearch.ResponseError, :t}}
      ],
      opts: opts
    })
  end
end
