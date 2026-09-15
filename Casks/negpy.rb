cask "negpy" do
  version "0.59.0"
  sha256 arm:   "ffd7181c5607e1bdeac3ffa1ec3facf2ba0bc149a3c6b92e45a24f17e4d5f288",
         intel: "6e7ac9cdc4d3cb07a6ceea63227b4935f5ae8110dc6eaf15af984859037490e3"

  arch arm: "arm64", intel: "6e7ac9cdc4d3cb07a6ceea63227b4935f5ae8110dc6eaf15af984859037490e3"

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
