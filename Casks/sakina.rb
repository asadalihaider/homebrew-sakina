cask "sakina" do
  version "0.1.1"
  sha256 "91be9ed73b4b5432455cdc2f8c04c89ff5e7e9bc25bf5e424eb7bfe4cea3c62e"

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
