cask "negpy" do
  version "0.66.0"
  sha256 arm:   "583a81e8ce7f37911265406367dbde88683cb06888e40753c7abbfb87589f6a2",
         intel: "4ff3ffc83036e90f7102edc127dca8c3feae30f25469fa71ee71579eea14b9d8"

  arch arm: "arm64", intel: "4ff3ffc83036e90f7102edc127dca8c3feae30f25469fa71ee71579eea14b9d8"

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
