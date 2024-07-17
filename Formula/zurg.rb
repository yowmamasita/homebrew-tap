class Zurg < Formula
    desc "Command line utility to manage your media downloads"
    homepage "https://github.com/debridmediamanager/zurg"

    # Method to construct the URL with the authentication token
    def self.private_url(url)
      "https://#{ENV["HOMEBREW_GITHUB_API_TOKEN"]}@#{url.sub(%r{^https://}, '')}"
    end

    if OS.mac?
      if Hardware::CPU.arm?
        url private_url("https://github.com/debridmediamanager/zurg/releases/latest/download/zurg-darwin-arm64.zip")
      end
      if Hardware::CPU.intel?
        url private_url("https://github.com/debridmediamanager/zurg/releases/latest/download/zurg-darwin-amd64.zip")
      end
    end
    if OS.linux?
      if Hardware::CPU.intel?
        url private_url("https://github.com/debridmediamanager/zurg/releases/latest/download/zurg-linux-amd64.zip")
      end
    end

    livecheck do
      url :stable
      regex(%r{href=.*?/tag/v?(\d+(?:\.\d+)+(?:-final)?)["' >]}i)
    end

    BINARY_ALIASES = {"aarch64-apple-darwin": {}, "x86_64-apple-darwin": {}, "x86_64-pc-windows-gnu": {}, "x86_64-unknown-linux-gnu": {}}

    def target_triple
      cpu = Hardware::CPU.arm? ? "aarch64" : "x86_64"
      os = OS.mac? ? "apple-darwin" : "unknown-linux-gnu"

      "#{cpu}-#{os}"
    end

    def install_binary_aliases!
      BINARY_ALIASES[target_triple.to_sym].each do |source, dests|
        dests.each do |dest|
          bin.install_symlink bin/source.to_s => dest
        end
      end
    end

    def install
      bin.install "zurg"

      install_binary_aliases!

      # Homebrew will automatically install these, so we don't need to do that
      doc_files = Dir["README.*", "readme.*", "LICENSE", "LICENSE.*", "CHANGELOG.*"]
      leftover_contents = Dir["*"] - doc_files

      # Install any leftover files in pkgshare; these are probably config or
      # sample files.
      pkgshare.install(*leftover_contents) unless leftover_contents.empty?
    end

    def caveats
      <<~EOS
        Note that this formula always pulls the latest release.
        Ensure you have set the HOMEBREW_GITHUB_API_TOKEN environment variable with your GitHub Personal Access Token.
      EOS
    end
  end
