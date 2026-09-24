cask "negpy" do
  version "0.60.0"
  sha256 arm:   "2d67afdd6ee5c2ded6a3e6be11defe71ee783db3748c6420580aed741cf90298",
         intel: "67111a51f02f37c163c6ac87d15de2198d96491cbe3741074221f25f5fa94970"

  arch arm: "arm64", intel: "67111a51f02f37c163c6ac87d15de2198d96491cbe3741074221f25f5fa94970"

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
