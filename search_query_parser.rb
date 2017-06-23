class SearchQueryParser

  def initialize(string)
    @text = string.gsub(/'([^']*)'/,'').split("tag:").join('').strip
    @tags = string.scan(/'([^']*)'/).flatten
  end

  def text
     @text
  end

  def tags
     @tags
  end

end

describe SearchQueryParser do
  describe '#text' do
    it "finds the text" do
      parser = described_class.new("tag:'monkey' tag:'monkey business' monkey")
      expect(parser.text).to eql('monkey')
    end
    it "finds the text with no tags" do
      parser = described_class.new('monkey banana fun-time')
      expect(parser.text).to eql('monkey banana fun-time')
    end
  end

  describe '#tags' do
    it "finds the tags" do
      parser = described_class.new("tag:'monkey' tag:'monkey business' monkey")
      expect(parser.tags).to eql(['monkey', 'monkey business'])
    end
    it "finds the tags with no text" do
      parser = described_class.new("tag:'monkey' tag:'monkey business'")
      expect(parser.tags).to eql(['monkey', 'monkey business'])
    end
  end
end
