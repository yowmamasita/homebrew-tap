# For zerobrew (`zb install yowmamasita/tap/helium-terminal`), which installs
# formulae but not app casks. Homebrew users should prefer the cask, which puts
# the app in /Applications: `brew install --cask yowmamasita/tap/helium-terminal`.
class HeliumTerminal < Formula
  desc "Lightweight libghostty terminal with vertical tabs for coding agents"
  homepage "https://github.com/yowmamasita/helium-terminal"
  url "https://github.com/yowmamasita/helium-terminal/archive/refs/tags/v0.1.1.tar.gz"
  sha256 "80b08d277bc767ba73f362d0c09c1bdcca989330372d3c3ac83e0e1c8c97eec2"
  license "MIT"

  bottle do
    root_url "https://github.com/yowmamasita/helium-terminal/releases/download/v0.1.1"
    sha256 cellar: :any_skip_relocation, arm64_ventura: "1c626e53a8ff180324635884adafec49b250be4facfe733f91f069659e7a4b9f"
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
