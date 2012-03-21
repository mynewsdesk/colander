require 'colander/invalid_file'
require 'colander/parser/base'
require 'open3'
module Colander
  module Parser
    class Xls < Base

      protected

      def payload
        File.read(@file_path)
      end
    end
  end
end
