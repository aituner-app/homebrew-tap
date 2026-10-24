cask "aituner" do
  version "0.3.0"
  sha256 "5f315ad5837e0cc360afa877ae1abfd454ef7a3292a99a90e7a8b264122cd09c"

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
