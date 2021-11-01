# Gettext printf interpolator

[![GitHub license](https://img.shields.io/badge/license-MIT-blue.svg)](https://raw.githubusercontent.com/jshmrtn/gettext_printf/main/LICENSE)
[![.github/workflows/ci.yml](https://github.com/jshmrtn/gettext_printf/actions/workflows/ci.yml/badge.svg)](https://github.com/jshmrtn/gettext_printf/actions/workflows/ci.yml)
[![Coverage Status](https://coveralls.io/repos/github/jshmrtn/gettext_printf/badge.svg?branch=main)](https://coveralls.io/github/jshmrtn/gettext_printf?branch=main)
[![License](https://img.shields.io/badge/License-BSL%201.1%20%2F%20Apache%202.0-blue.svg)](https://mariadb.com/bsl11/)
[![Last Updated](https://img.shields.io/github/last-commit/jshmrtn/gettext_printf.svg)](https://github.com/jshmrtn/gettext_printf/commits/main)
[![Hex.pm Version](https://img.shields.io/hexpm/v/gettext_printf.svg?style=flat)](https://hex.pm/packages/gettext_printf)

Providing a [gettext](https://hex.pm/packages/gettext) printf interpolator.

This provides a message format close to the [C Format String](https://www.gnu.org/software/gettext/manual/gettext.html#c_002dformat) specification for gettext.

## Installation

The package can be installed by adding `gettext_printf` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:gettext_printf, "~> 0.1.0"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). The docs can
be found at [https://hexdocs.pm/gettext_printf](https://hexdocs.pm/gettext_printf).

