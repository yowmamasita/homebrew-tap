# For zerobrew (`zb install yowmamasita/tap/helium-terminal`), which installs
# formulae but not app casks. Homebrew users should prefer the cask, which puts
# the app in /Applications: `brew install --cask yowmamasita/tap/helium-terminal`.
class HeliumTerminal < Formula
  desc "Lightweight libghostty terminal with vertical tabs for coding agents"
  homepage "https://github.com/yowmamasita/helium-terminal"
  url "https://github.com/yowmamasita/helium-terminal/archive/refs/tags/v0.1.3.tar.gz"
  sha256 "ddc067c6c852dcaa4afa3f8b6b57af4378cd2231c8a40abd98b867d7d2b625f8"
  license "MIT"

  bottle do
    root_url "https://github.com/yowmamasita/helium-terminal/releases/download/v0.1.3"
    sha256 cellar: :any_skip_relocation, arm64_ventura: "a4c12afd8b3e84e2c357e45c06140c17698d83d070e752ef5ea2ed1dd463dc56"
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
