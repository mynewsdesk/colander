module Colander
  module Parser
    class Base

      def initialize(file_path)
        @file_path = file_path
      end

      def headers
        @headers ||= collect_headers
      end

      def emails
        @emails ||= collect_emails
      end

      def rows
        @rows ||= collect_rows
      end

      def payload
        raise "plz implement me in"
      end

      protected

      def collect_emails
        parse_file.scan(EMAIL_REGEXP).flatten.uniq
      rescue Exception => e
        raise InvalidFile.new e
      end

      def collect_headers
        return [] unless first_row_is_headers?
        first_row
      end

      def collect_rows
        start_at = first_row_is_headers? ? 1 : 0
        spreadsheet.parse(headers: first_row_is_headers?)[start_at..-1]
      end

      def first_row
        spreadsheet.row(spreadsheet.first_row)
      end

      def first_row_is_headers?
        !first_row.to_s.match EMAIL_REGEXP
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
