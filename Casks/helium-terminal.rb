cask "helium-terminal" do
  version "0.1.11"
  sha256 "28de7a376d66ad4527706455f0890089922395b2843ba962a483874c4e0542c5"

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
