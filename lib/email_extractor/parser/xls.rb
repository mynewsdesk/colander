require 'email_extractor/parser/base'
require 'roo'

module EmailExtractor
  module Parser
    class Xls < Base
      def parse
        spreadsheet = Excel.new(@file_path,nil,:ignore)
        @emails = collect_emails spreadsheet
      rescue TypeError, IOError
        raise "Invalid file"
      end

      protected

      def collect_emails(spreadsheet)
        spreadsheet.sheets.map do |sheet|
          spreadsheet.default_sheet = sheet
          spreadsheet.to_yaml.scan(/\b[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}\b/)
        end.flatten
      end

    end
  end
end