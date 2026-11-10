cask "negpy" do
  version "0.68.0"
  sha256 arm:   "2b32584308974db0c7ee5a423d6c0dee06fb30375e1b02f4aeaee4df0c6e1d46",
         intel: "9a920282e7610b53960aaba1b9672f7206776dd13937540a36b2b21addf4e872"

  arch arm: "arm64", intel: "9a920282e7610b53960aaba1b9672f7206776dd13937540a36b2b21addf4e872"

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
