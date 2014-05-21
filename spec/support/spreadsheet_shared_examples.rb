RSpec.shared_examples "a spreadsheet parser" do
  let(:parser) { described_class.new(file_with_headers) }

  describe "#headers" do
    it "returns an empty array" do
      expect(parser.headers).to eq headers
    end
  end

  describe '#rows' do
    it "returns an array of rows" do
      expect(parser.rows).to be_a Array
    end

    it "each row is a hash with the headers as key" do
      row = parser.rows.first
      expect(row).to be_a Hash
      expect(row.keys).to eq headers
      expect(row.values).to eq first_row_values
      expect(row[headers.first]).to eq first_row_values.first
    end
  end
end
