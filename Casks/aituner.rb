cask "aituner" do
  version "0.0.1"
  sha256 "4ffeed89e808f7ef794758b048aa9af0d67cc437a90357b13b1eb157966b6b0d"

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
