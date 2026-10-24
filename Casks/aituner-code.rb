cask "aituner-code" do
  version "0.1.0"
  sha256 "19cea41b63f55b6b12fe89e998c9084bc65f8e4044122fada96512ac92ea96c2"

  url "https://github.com/aituner-app/code-releases/releases/download/v#{version}/aituner-code-#{version}.zip"
  name "AiTuner Code"
  desc "Coding agent on the model aituner runs on this Mac"
  homepage "https://aituner.app/code/"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on arch: :arm64
  depends_on macos: :sonoma

  app "AiTuner Code.app"
  binary "#{appdir}/AiTuner Code.app/Contents/MacOS/aituner-code"

  uninstall quit: "ai.aituner.code"

  zap trash: [
    "~/Library/Application Support/aituner-code",
    "~/Library/Preferences/ai.aituner.code.plist",
    "~/Library/Saved Application State/ai.aituner.code.savedState",
  ]
end
