require 'bundler/inline'

gemfile do
  source 'https://rubygems.org'
  gem 'rspec'
  gem 'pry-byebug'
end

require 'rspec/autorun'

def solution(input, markers)
  input.gsub(/\s+[#{markers.join}].*/, "")
end



RSpec.describe do
  describe '#solution' do
    subject { solution(input, markers) }

    context 'first' do
      let(:input) { "apples, plums % and bananas\npears\noranges !applesauce"}
      let(:markers) {  ["%", "!"]  }
      let(:expected) { "apples, plums\npears\noranges" }

      it { should eq expected }
    end

    context 'second' do
      let(:input) { "Q @b\nu\ne -e f g"}
      let(:markers) {  ["@", "-"] }
      let(:expected) { "Q\nu\ne" }

      it { should eq expected }
    end
  end
end
