require_relative '../app/scanner'
require_relative '../app/pattern_literal'

RSpec.describe PatternLiteral do

  string = "a"
  source = "b"
  let (:scanner) { Scanner.new(source) }
  subject { PatternLiteral.new(string).matches?(scanner) }

  context "when matching a literal against itself" do
    before { string = source = "a" }
    it { is_expected.to be true }
  end

  context "when matching a literal against a different character" do
    before do
      string =  "a"
      source = "b"
    end

    it { is_expected.to be false }
  end
end
