# For zerobrew (`zb install yowmamasita/tap/helium-terminal`), which installs
# formulae but not app casks. Homebrew users should prefer the cask, which puts
# the app in /Applications: `brew install --cask yowmamasita/tap/helium-terminal`.
class HeliumTerminal < Formula
  desc "Lightweight libghostty terminal with vertical tabs for coding agents"
  homepage "https://github.com/yowmamasita/helium-terminal"
  url "https://github.com/yowmamasita/helium-terminal/archive/refs/tags/v0.1.7.tar.gz"
  sha256 "b6fbd2adead9837275b6fc9d74397e6f7f17d7a1b7ece21ccf87fc2526f0e694"
  license "MIT"

  bottle do
    root_url "https://github.com/yowmamasita/helium-terminal/releases/download/v0.1.7"
    sha256 cellar: :any_skip_relocation, arm64_ventura: "be6e816c65811c42aa8b6fa14d90e073104f81edff33af87276185448e6312db"
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
