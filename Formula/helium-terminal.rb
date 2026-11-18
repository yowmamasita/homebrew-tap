# For zerobrew (`zb install yowmamasita/tap/helium-terminal`), which installs
# formulae but not app casks. Homebrew users should prefer the cask, which puts
# the app in /Applications: `brew install --cask yowmamasita/tap/helium-terminal`.
class HeliumTerminal < Formula
  desc "Lightweight libghostty terminal with vertical tabs for coding agents"
  homepage "https://github.com/yowmamasita/helium-terminal"
  url "https://github.com/yowmamasita/helium-terminal/archive/refs/tags/v0.1.14.tar.gz"
  sha256 "32562972d72c36e45d2ad87de0bd75dacee1e79c568fe65ec3e4dcfc7abca7cc"
  license "MIT"

  bottle do
    root_url "https://github.com/yowmamasita/helium-terminal/releases/download/v0.1.14"
    sha256 cellar: :any_skip_relocation, arm64_ventura: "860cb431fbb75fd5285d96535df25e71f429919ffd843518bda3110a0651da51"
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
