# SampleApp

SampleApp is a minimal example application demonstrating how `NervesTips`
discovers and retrieves tips from registered providers.

This app loads tips from `package_a` and `package_b`, both of which opt into
the `NervesTips` system.

## Setup

```sh
cd examples/sample_app
mix deps.get
```

## Usage

Start an IEx session:

```sh
iex -S mix
```

Retrieve tips:

```elixir
NervesTips.all()    # Get all tips
NervesTips.random() # Get a random tip
```
