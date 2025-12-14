import Config

config :oapi_generator,
  default: [
    # renderer: OpenApiMeilisearch.Plugins.Renderer,
    output: [
      base_module: OpenApiMeilisearch,
      location: "lib/open_api_meilisearch",
      operation_subdirectory: "operations/",
      schema_subdirectory: "schemas/"
      # schema_use: OpenApiMeilisearch.Encoder
    ]
  ]
