defmodule OpenApiMeilisearch.VersionResponse do
  @moduledoc """
  Provides struct and type for a VersionResponse
  """

  @type t :: %__MODULE__{commitDate: String.t(), commitSha: String.t(), pkgVersion: String.t()}

  defstruct [:commitDate, :commitSha, :pkgVersion]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [commitDate: :string, commitSha: :string, pkgVersion: :string]
  end
end
