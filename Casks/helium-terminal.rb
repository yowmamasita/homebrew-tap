cask "helium-terminal" do
  version "0.1.10"
  sha256 "b53ac35c585552cb7978d62c4031c7c669030e3b19465dc6e6c0bf1e8c46e239"

  url "https://github.com/yowmamasita/helium-terminal/releases/download/v#{version}/helium-terminal-#{version}-macos-arm64.zip"
  name "Helium Terminal"
  desc "Lightweight libghostty terminal with vertical tabs for coding agents"
  homepage "https://github.com/yowmamasita/helium-terminal"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  depends_on arch: :arm64
  depends_on macos: :ventura

  app "Helium Terminal.app"
  binary "#{appdir}/Helium Terminal.app/Contents/MacOS/helium-terminal", target: "helium"

  zap trash: [
    "~/Library/Application Support/helium-terminal",
    "~/Library/Preferences/io.github.yowmamasita.helium-terminal.plist",
    "~/Library/Saved Application State/io.github.yowmamasita.helium-terminal.savedState",
  ]
end
