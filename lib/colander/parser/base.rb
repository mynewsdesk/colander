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
        std_out, std_err, exit_status = Open3.capture3("strings", :stdin_data => force_utf8_encoding(payload))
        if exit_status == 0
          force_utf8_encoding(std_out)
        else
          raise RuntimeError.new(std_err)
        end
      end

      def force_utf8_encoding(string)
        string.force_encoding("iso-8859-1").
          encode("UTF-8", :invalid => :replace, :undef => :replace, :replace => "?")
      end
    end
  end
end
