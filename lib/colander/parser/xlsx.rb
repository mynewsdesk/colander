require 'colander/parser/base'
require 'zip'
require 'iconv'
module Colander
  module Parser
    class Xlsx < Xls

      protected

      def payload
        ''.tap do |string|
          Zip::ZipInputStream::open(@file_path) do |io|
            while (entry = io.get_next_entry)
              string << io.read
            end
          end
        end
      end
    end
  end
end
