require 'colander/parser/base'

module Colander
  module Parser
    class Null
      def parse
      end
      def emails
        []
      end
    end
  end
end

