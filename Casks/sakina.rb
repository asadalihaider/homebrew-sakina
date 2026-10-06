cask "sakina" do
  version "0.1.0"
  sha256 "cc7833cedc706932f7785c2ca50e876941511aed301f6101581ace2b033835cd"

  url "https://github.com/asadalihaider/pray-with-sakina/releases/download/v#{version}/Sakina.zip"
  name "Sakina"
  desc "Prayer companion that lives in the menu bar"
  homepage "https://github.com/asadalihaider/pray-with-sakina"

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
