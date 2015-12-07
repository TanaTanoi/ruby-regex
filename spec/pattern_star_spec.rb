require_relative '../app/scanner'
require_relative '../app/pattern_star'
require_relative '../app/pattern_literal'

RSpec.describe PatternStar do
  string = PatternLiteral.new("a")
  source = "a"
  let (:scanner) { Scanner.new(source) }
  subject { PatternStar.new(string).matches?(scanner) }

  context "when matching 'a*' against 'a'" do
    before { source = "a" }

    it { is_expected.to be true }
  end

  context "when matching 'a*' against a lot of 'a's and a 'b'" do
    before { source = "aaaabaaa" }

    it { is_expected.to be true }
  end

  context "when matching 'a*' against other chars" do
    before { source = "bbb" }

    it { is_expected.to be true }
  end
end
