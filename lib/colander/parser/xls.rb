require 'colander/invalid_file'
require 'colander/parser/base'
require 'roo'

module Colander
  module Parser
    class Xls < Base
      def parse
        spreadsheet = parse_file
        @emails = collect_emails spreadsheet
      rescue TypeError, IOError
        raise InvalidFile
      end

      protected

      def parse_file
        Excel.new(@file_path,nil,:ignore)
      end

      def collect_emails(spreadsheet)
        spreadsheet.sheets.map do |sheet|
          spreadsheet.default_sheet = sheet
          spreadsheet.to_yaml.scan(/\b[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}\b/)
        end.flatten
      end

    end
  end
end