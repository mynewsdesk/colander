module EmailExtractor
  module Parser
    class Base
     def initialize(file_path)
     end
      def initialize(file_path)
        @file_path = file_path
      end

      def parse
        raise "plz implement me in"
      end
    end
  end
end