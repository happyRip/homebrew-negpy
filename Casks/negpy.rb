cask "negpy" do
  version "0.64.0"
  sha256 arm:   "a35408e1e9808f2dea2d712524610147dd8ba9f94927874b60de62080455b5bd",
         intel: "46415e7b24909ccdb5a347b0092f85a0e0b1d297e5e342f2edb116dd23d4862a"

  arch arm: "arm64", intel: "46415e7b24909ccdb5a347b0092f85a0e0b1d297e5e342f2edb116dd23d4862a"

  url "https://github.com/marcinz606/NegPy/releases/download/#{version}/NegPy-#{version}-macOS-#{arch}.dmg"
  name "NegPy"
  desc "Film-negative processing app"
  homepage "https://github.com/marcinz606/NegPy"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates false
  depends_on macos: ">= :ventura"

  app "NegPy.app"

  postflight do
    system_command "/usr/bin/xattr",
                    args: ["-cr", "#{appdir}/NegPy.app"],
                    sudo: false
  end

  zap trash: [
    "~/Library/Application Support/NegPy",
    "~/Library/Preferences/com.negpy.NegPy.plist",
    "~/Library/Saved Application State/com.negpy.NegPy.savedState",
  ]
end
