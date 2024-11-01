class WhatToTest < Formula
  desc "Generates a coverage file for your project to analyze and determine what is the next most impactful code to create a unit test for"
  homepage "https://github.com/yowmamasita/what_to_test"
  url "https://raw.githubusercontent.com/yowmamasita/what_to_test/refs/heads/main/what_to_test.py"
  license "MIT"

  depends_on "python@3.9"

  def install
    bin.install "what_to_test.py" => "what_to_test"
    chmod 0755, bin/"what_to_test"
  end

  test do
    assert_match "Usage", shell_output("#{bin}/what_to_test --help")
  end
end
