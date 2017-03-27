require "spec_helper"

require_relative '../lib/gitparser'
describe Gitparser do
  before do
    @parser = Gitparser::Parse.new
  end
  it "has a version number" do
    expect(Gitparser::VERSION).not_to be nil
  end

  it 'parse out 132 old repos' do
    repos = @parser.parse_git_html('./spec/resources/git.html', 30)
    expect(repos.size).to eq(132)
    repos.each do |repo|
      p repo
    end
  end
end
