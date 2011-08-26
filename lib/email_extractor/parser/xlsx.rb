require 'email_extractor/parser/base'
require 'roo'

module EmailExtractor
  module Parser
    class Xlsx < Xls
      protected
      def parse_file
        Excelx.new(@file_path,nil,:ignore)
      end
    end
  end
end