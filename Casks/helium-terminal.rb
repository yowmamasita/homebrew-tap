cask "helium-terminal" do
  version "0.1.14"
  sha256 "bea02718b2284df2ee699057951084d98fbb02d57d96a543efe7bed6f14e9176"

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
