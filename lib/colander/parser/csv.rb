require 'colander/invalid_file'
require 'colander/parser/base'
require 'roo'

module Colander
  module Parser
    class Csv < Base

      protected

      def spreadsheet
        @spreadsheet = Roo::CSV.new(@file_path)
      end

      def payload
        File.read(@file_path)
      end
    end
  end
end
