describe "SCSS" do
  let(:lint_result) { SCSSLint::CLI.new.run ["-c", "#{Rails.root}/.scss-lint.yml", "-o", "/dev/null"] }

  it "passes linter" do
    # Requiring outside the context makes SCSSLint global, which causes problems
    require 'scss_lint'
    require 'scss_lint/cli'
    expect(lint_result).to eql(0),
                           "SCSS linting failed! Run `scss-lint -c .scss-lint.yml` to show lint."
  end
end
