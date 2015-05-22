require 'scss_lint'
require 'scss_lint/cli'

describe "SCSS" do
  let(:lint_result) { SCSSLint::CLI.new.run ["-c", "#{Rails.root}/.scss-lint.yml"] }

  it "passes linter" do
    expect(lint_result).to eql(0),
                           "SCSS linting failed! Run `scss-lint -c .scss-lint.yml` to show lint."
  end
end
