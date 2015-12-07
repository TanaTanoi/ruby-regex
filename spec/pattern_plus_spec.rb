require_relative '../app/scanner'
require_relative '../app/pattern_plus'
require_relative '../app/pattern_literal'

RSpec.describe PatternPlus do
  string = PatternLiteral.new("a")
  source = "a"
  let (:scanner) { Scanner.new(source) }
  subject { PatternPlus.new(string).matches?(scanner) }

  context "when matching a dot againt an 'a'" do
    before { source = "a" }

    it { is_expected.to be true }
  end

  context "when matching 'a+' against some 'a's and a 'b'" do
    before { source = "aaaabaaa" }

    it { is_expected.to be true }
  end

  context "when matching 'a+' against some 'b's" do
    before { source = "bbb" }

    it { is_expected.to be false }
  end
end
