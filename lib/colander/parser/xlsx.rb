require 'colander/parser/base'
require 'roo'

module Colander
  module Parser
    class Xlsx < Xls
      protected
      def parse_file
        Excelx.new(@file_path,nil,:ignore)
      end
    end
  end
end