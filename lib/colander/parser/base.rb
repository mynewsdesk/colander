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
        parse_file.scan(EMAIL_REGEXP).flatten.uniq
      end

      def parse_file
        std_out, std_err, exit_status = Open3.capture3("strings", :stdin_data => payload.encode("UTF-8", :invalid => :replace, :undef => :replace, :replace => "?"))
        if exit_status == 0
          std_out
        else
          raise RuntimeError.new(std_err)
        end
      end

    end
  end
end
