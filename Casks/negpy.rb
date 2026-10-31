cask "negpy" do
  version "0.67.0"
  sha256 arm:   "523050a11b904d45e7adf9cdf8c491a6950627b89e7b673e11d98a0d046d2a15",
         intel: "1ac9810460f89c8b1e2cf2ab9b61dd14314fd8f8e6096ae0a56d8cbac1a34ac9"

  arch arm: "arm64", intel: "1ac9810460f89c8b1e2cf2ab9b61dd14314fd8f8e6096ae0a56d8cbac1a34ac9"

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
