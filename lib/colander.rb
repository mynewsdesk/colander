require 'colander/invalid_file'
require 'colander/parser/xls'
require 'colander/parser/xlsx'
require 'colander/parser/plain'

module Colander
  EMAIL_REGEXP = /[[:alnum:]][^\s:<>]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}\b/

  def self.parse(file_path, file_name = nil)
    parser = case (file_name || file_path).split(".").last
             when "xls"
               Parser::Xls.new(file_path)
             when "xlsx"
               Parser::Xlsx.new(file_path)
             when "csv", "txt"
               Parser::Plain.new(file_path)
             else
               raise InvalidFile
             end
    parser.parse
    parser
  end
end
