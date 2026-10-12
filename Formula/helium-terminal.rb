# For zerobrew (`zb install yowmamasita/tap/helium-terminal`), which installs
# formulae but not app casks. Homebrew users should prefer the cask, which puts
# the app in /Applications: `brew install --cask yowmamasita/tap/helium-terminal`.
class HeliumTerminal < Formula
  desc "Lightweight libghostty terminal with vertical tabs for coding agents"
  homepage "https://github.com/yowmamasita/helium-terminal"
  url "https://github.com/yowmamasita/helium-terminal/archive/refs/tags/v0.1.6.tar.gz"
  sha256 "3ce4cd5417f114a05f4a827d9c215ca890a40cfa11db922a1983b423b0bdde04"
  license "MIT"

  bottle do
    root_url "https://github.com/yowmamasita/helium-terminal/releases/download/v0.1.6"
    sha256 cellar: :any_skip_relocation, arm64_ventura: "1b041e5c79344b462c76fb0d0d9e3f8c165880b664412b46307e1b089676c108"
  end

  depends_on arch: :arm64
  depends_on macos: :ventura

  def install
    odie "Building from source needs Zig and Xcode; see the README. Install the bottle or the cask instead."
  end

  def caveats
    <<~EOS
      Run `helium` to open the app, or open #{opt_prefix}/Helium Terminal.app.
    EOS
  end

  test do
    assert_match "usage: helium", shell_output("#{bin}/helium help")
  end
end
