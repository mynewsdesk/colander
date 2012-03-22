module Colander
  module Parser
    class Base
      attr_reader :emails

      def initialize(file_path)
        @file_path = file_path
      end

      def parse
        @emails = collect_emails
      rescue Exception => e
        raise InvalidFile.new e
      end

      def payload
        raise "plz implement me in"
      end

      protected

      def collect_emails
        parse_file.scan(/\b[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}\b/).flatten.uniq
      end

      def parse_file
        ic = Iconv.new("UTF-8//IGNORE", "UTF-8")
        std_out, std_err, exit_status = Open3.capture3("strings", :stdin_data => ic.iconv(payload))
        if exit_status == 0
          ic.iconv(std_out)
        else
          raise RuntimeError.new(std_err)
        end
      end

    end
  end
end
