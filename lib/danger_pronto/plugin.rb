module Danger
  # Lints files via Pronto through specified runners
  # Results are displayed as a table in markdown
  #
  # [Runners](https://github.com/mmozuras/pronto#runners)
  #
  # @example Lint files with Pronto and specified Pronto Runners
  #
  #          pronto.lint
  #
  # @see  RestlessThinker/danger-pronto
  # @tags pronto, linter
  #
  class DangerPronto < Plugin

    # Runs files through Pronto. Generates a `markdown` list of warnings.
    #
    # @param [String] files
    #         A globbed string which should return the files that you want to
    #         run though, defaults to nil. If nil, modified and added files from
    #         the diff will be used.
    # @return [void]
    #
    def lint(files = nil)
      files_to_lint = fetch_files_to_lint(files)

      return if offending_files.empty?

      markdown offenses_message(offending_files)
    end

    def offending_files(files = nil)
      files_to_lint = fetch_files_to_lint(files)
      pronto(files_to_lint)
    end

    private

    # Executes pronto command
    #
    # @param [Array<String>] Files to lint
    # @return [Hash] Converted hash from pronto json output
    #
    def pronto(files_to_lint)
      pronto_output = `#{'bundle exec ' if File.exists?('Gemfile')}pronto run -f json`

      JSON.parse(pronto_output)
          .select { |f| files_to_lint.include?(f['path']) }
    end

    # Builds the t
    def offenses_message(offending_files)
      require 'terminal-table'

      message = "### Pronto violations\n\n"
      table = Terminal::Table.new(
        headings: %w(File Line Reason Runner),
        style: { border_i: '|' },
        rows: offending_files.each do |file|
          [file['path'], file['line'], file['message'], file['runner']]
        end
      ).to_s
      message + table.split("\n")[1..-2].join("\n")
    end

    # Sets default files to modified and added files per commit
    # @param [Array<String>] Files to lint
    #
    # @return [Array<String>] Final files to lint
    #
    def fetch_files_to_lint(files = nil)
      @files_to_lint ||= (files ? Dir.glob(files) : (git.modified_files + git.added_files))
    end
  end
end
