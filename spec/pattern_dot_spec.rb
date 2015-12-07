require_relative '../app/scanner'
require_relative '../app/pattern_dot'

RSpec.describe PatternDot do
  source = "a"
  let (:scanner) { Scanner.new(source) }
  subject { PatternDot.new.matches?(scanner) }

  context "when matching a dot againt an 'a'" do
    before { source = "a" }

    it { is_expected.to be true }
  end

  context "when matching a dot against an '8'" do
    before { source = "8"}

    it { is_expected.to be true }
  end

  context "when matching a dot against empty" do
    before { source = ""}

    it { is_expected.to be false }
  end
end
