cask "aituner" do
  version "0.1.0"
  sha256 "1cf552dd839aa06fa9e12ac3665972b68eb8ab8b05cf4c87deab00b18148447a"

  url "https://github.com/aituner-app/releases/releases/download/v#{version}/aituner-#{version}.zip"
  name "aituner"
  desc "Benchmark Apple Silicon Macs for local AI"
  homepage "https://aituner.app/"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on arch: :arm64
  depends_on macos: :sonoma

  app "aituner.app"

  uninstall quit: "ai.aituner.app"

  zap launchctl: [
        "ai.aituner.ollama-env",
        "ai.aituner.wiredlimit",
      ],
      trash:     [
        "~/.config/aituner",
        "~/Library/Application Support/aituner",
        "~/Library/Caches/ai.aituner.app",
        "~/Library/HTTPStorages/ai.aituner.app",
        "~/Library/Preferences/ai.aituner.app.plist",
        "~/Library/WebKit/ai.aituner.app",
      ]
end
