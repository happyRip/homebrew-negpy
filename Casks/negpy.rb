cask "negpy" do
  version "0.71.0"
  sha256 arm:   "0eeceeb2a53c4158ed75649c76e772cadea42857ba7e73724e882e97243d6cd9",
         intel: "5de5b9e0a98f3f2215667585dbb8ecfb3acbbbc0a5ecbcb78fd08f4174f3e9d3"

  arch arm: "arm64", intel: "5de5b9e0a98f3f2215667585dbb8ecfb3acbbbc0a5ecbcb78fd08f4174f3e9d3"

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
