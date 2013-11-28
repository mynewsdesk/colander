require 'colander/invalid_file'
require 'colander/parser/base'
module Colander
  module Parser
    class Plain < Base

      protected

      def payload
        File.read(@file_path)
      end

      def parse_file
        payload
      end
    end
  end
end
