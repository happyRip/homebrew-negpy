cask "negpy" do
  version "0.69.0"
  sha256 arm:   "63694be077aae2bea3418da949a2202927b552f5c540dd20d35ce267e042f55f",
         intel: "17adeb96e5e1162b54b3b20f4663e66468d272b4f5c90e6dd10996a8d016dc38"

  arch arm: "arm64", intel: "17adeb96e5e1162b54b3b20f4663e66468d272b4f5c90e6dd10996a8d016dc38"

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
