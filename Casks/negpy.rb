cask "negpy" do
  version "0.71.1"
  sha256 arm:   "42854b6506f99e08db829e0a7d12cc9c37bca5e6848cf06c0470d7b74169fc1b",
         intel: "1b28b3fe4832d5c315fe0bdc70b8bd1307fdad60e06a8dbf081af7eab3b1ec9b"

  arch arm: "arm64", intel: "1b28b3fe4832d5c315fe0bdc70b8bd1307fdad60e06a8dbf081af7eab3b1ec9b"

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
