cask "sakina" do
  version "0.1.3"
  sha256 "514932422b272d31bf27fb68167648028f0a96a583ed678b4163a6658d7fd8f8"

  url "https://github.com/asadalihaider/pray-with-sakina/releases/download/v#{version}/Sakina.zip"
  name "Sakina"
  desc "Prayer companion that lives in the menu bar"
  homepage "https://github.com/asadalihaider/pray-with-sakina"

  auto_updates true
  depends_on macos: :ventura

  app "Sakina.app"

  uninstall quit: "dev.asadalihaider.sakina"

  zap trash: [
    "~/Library/Application Support/dev.asadalihaider.sakina",
    "~/Library/LaunchAgents/Sakina.plist",
  ]

  # Sakina is signed but not notarised, which needs a paid Apple Developer
  # account, so the first launch goes through System Settings → Privacy &
  # Security → Open Anyway. The cask deliberately does not clear Gatekeeper's
  # quarantine flag on your behalf: that is a security check, and whether to
  # waive it is yours to decide, with `brew install --cask --no-quarantine`.
  caveats <<~CAVEATS
    Sakina is signed but not notarised. The first time you open it, macOS will
    say it could not verify the app. Allow it once in
      System Settings → Privacy & Security → Open Anyway
  CAVEATS
end
