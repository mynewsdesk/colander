require 'colander/invalid_file'
require 'colander/parser/base'
require 'roo'

module Colander
  module Parser
    class Csv < Base

      def headers
        roo.row(roo.first_row).map &:strip
      end

      protected

      def roo
        Roo::CSV.new(@file_path)
      end

      def payload
        File.read(@file_path)
      end
    end
  end
end
