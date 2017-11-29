# danger-pronto

[![License](http://img.shields.io/badge/license-MIT-green.svg?style=flat)](LICENSE.txt)
[![Gem](https://img.shields.io/gem/v/danger-pronto.svg?style=flat)](https://rubygems.org/gems/danger-pronto)

A [Danger](https://github.com/danger/danger) plugin for [Pronto](https://github.com/mmozuras/pronto).
Created by the folks at [ABODO](https://www.abodo.com). By default, only lints added or modified files.

## Installation

Add this line to your Gemfile:

```rb
gem 'danger-pronto'
```

Add pronto and runners to your Gemfile:

```rb
gem 'pronto'
gem 'pronto-jshint'
gem 'pronto-rubocop'
gem 'pronto-scss'
```

## Usage

Pronto runs the checks on a diff between the current HEAD and the provided commit-ish (default is master).
Results are passed out as a table in markdown.


Specifying custom config file.
```ruby
pronto.lint
```

Run checks on a diff between the current HEAD and a specified commit
```ruby
pronto.lint("e757913")
```

#### Methods


`lint(commit: String)`

 Runs checks on a diff between the current HEAD and the provided commit-ish (default is master). Generates a `markdown` list of warnings.



## License

MIT
