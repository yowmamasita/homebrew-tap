cask "helium-terminal" do
  version "0.1.2"
  sha256 "7d301d8f5395f051d58eb94991f782d4c23f961aa78adfb98364322ba66aca25"

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
  depends_on macos: ">= :ventura"

  app "Helium Terminal.app"
  binary "#{appdir}/Helium Terminal.app/Contents/MacOS/helium-terminal", target: "helium"

  zap trash: [
    "~/Library/Application Support/helium-terminal",
    "~/Library/Preferences/io.github.yowmamasita.helium-terminal.plist",
    "~/Library/Saved Application State/io.github.yowmamasita.helium-terminal.savedState",
  ]
end
