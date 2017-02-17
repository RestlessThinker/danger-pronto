# danger-pronto

[![License](http://img.shields.io/badge/license-MIT-green.svg?style=flat)](LICENSE.txt)

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

Run Files through Pronto.
Results are passed out as a table in markdown.


> Specifying custom config file.
> ```ruby
pronto.lint
> ```

> Lint specific files in a folder, when they change
> ```ruby
public_files = (modified_files + added_files).select { |path| path.include?("/public/") }
pronto.lint public_files
> ```

#### Methods


`lint(files: String)`

 Runs files through Pronto. Generates a `markdown` list of warnings.



## License

MIT
