cask "negpy" do
  version "0.62.0"
  sha256 arm:   "9d835882ddf05ab30c3ee2327fde1dc22b53eb8e3bae046e8595db4de06395b2",
         intel: "8f401076ca5cc802a71ddf1b428715f2e460caa35d2923944cc47f7db7ec0a0f"

  arch arm: "arm64", intel: "8f401076ca5cc802a71ddf1b428715f2e460caa35d2923944cc47f7db7ec0a0f"

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
