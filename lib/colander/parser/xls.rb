require 'colander/invalid_file'
require 'colander/parser/base'
require 'open3'
require 'roo'

module Colander
  module Parser
    class Xls < Base

      protected

      def spreadsheet
        @spreadsheet ||= Roo::Excel.new(@file_path)
      end

      def payload
        File.read(@file_path)
      end
    end
  end
end
