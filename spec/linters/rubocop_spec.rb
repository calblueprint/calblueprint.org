require "rubocop"

describe "Ruby code" do
  let(:rubocop_result) { RuboCop::CLI.new.run ["-R", "-c", ".rubocop.yml", "-o", "/dev/null"] }

  it "passes rubocop check" do
    expect(rubocop_result).to eql(0),
                              "Rubocop failed! Run `rubocop -c .rubocop.yml` to show failures."
  end
end
