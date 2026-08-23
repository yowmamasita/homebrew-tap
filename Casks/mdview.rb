cask "mdview" do
  version "0.1.2"
  sha256 "f949142c4e918fa1b0bf25fa652446b9e8b8dc25d8b10d75887494f42a4c53f3"

  url "https://github.com/yowmamasita/mdview/releases/download/v#{version}/mdview-macos-universal-app.tar.gz"
  name "mdview"
  desc "Lightweight viewer for Markdown with Mermaid diagrams"
  homepage "https://github.com/yowmamasita/mdview"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :catalina

  app "mdview.app"
  binary "#{appdir}/mdview.app/Contents/MacOS/mdview"

  zap trash: [
    "~/Library/Application Support/mdview",
    "~/Library/Caches/io.github.yowmamasita.mdview",
    "~/Library/Preferences/io.github.yowmamasita.mdview.plist",
    "~/Library/Saved Application State/io.github.yowmamasita.mdview.savedState",
    "~/Library/WebKit/io.github.yowmamasita.mdview",
  ]
end
