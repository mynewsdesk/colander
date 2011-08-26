require 'email_extractor/parser/xls'
require 'email_extractor/parser/xlsx'

module EmailExtractor
  def self.parse(file_path, file_name = nil)
    parser = case (file_name || file_path).split(".").last
    when "xls"
      Parser::Xls.new(file_path)
    when "xlsx"
      Parser::Xlsx.new(file_path)
    end
    parser.parse
    parser
  end
end
