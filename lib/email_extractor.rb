require 'email_extractor/parser/base'
require 'email_extractor/parser/xls'
require 'email_extractor/parser/xlsx'

module EmailExtractor
  def self.parse(file_path)
    case file_path.split(".").last
    when "xls"
      Parser::Xls.new(file_path)
    end
  end
end
