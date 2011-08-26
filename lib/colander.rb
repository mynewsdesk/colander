require 'colander/invalid_file'
require 'colander/parser/xls'
require 'colander/parser/xlsx'

module Colander
  def self.parse(file_path, file_name = nil)
    parser = case (file_name || file_path).split(".").last
    when "xls"
      Parser::Xls.new(file_path)
    when "xlsx"
      Parser::Xlsx.new(file_path)
    else
      raise InvalidFile
    end
    parser.parse
    parser
  end
end
