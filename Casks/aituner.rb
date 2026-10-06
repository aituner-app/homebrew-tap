cask "aituner" do
  version "0.0.1"
  sha256 "0000000000000000000000000000000000000000000000000000000000000000"

  url "https://github.com/aituner-app/releases/releases/download/v#{version}/aituner-#{version}.zip"
  name "aituner"
  desc "Benchmark local AI on Apple Silicon Macs and find the models that fit"
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
        "~/Library/Application Support/ai.aituner.app",
        "~/Library/Application Support/aituner",
        "~/Library/Caches/ai.aituner.app",
        "~/Library/HTTPStorages/ai.aituner.app",
        "~/Library/Preferences/ai.aituner.app.plist",
        "~/Library/Saved Application State/ai.aituner.app.savedState",
        "~/Library/WebKit/ai.aituner.app",
      ]
end
