import Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :elixir_chat, ElixirChatWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "a3pg8zmILKgACWpfp3eEubwwTcuZ6aCjtVh6xuHXYHBmeMmwekTAeDT8aSz3ffas",
  server: false

# In test we don't send emails.
config :elixir_chat, ElixirChat.Mailer,
  adapter: Swoosh.Adapters.Test

# Print only warnings and errors during test
config :logger, level: :warn

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime
