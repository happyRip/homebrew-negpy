cask "negpy" do
  version "0.70.0"
  sha256 arm:   "2b6bdd82d32405e82aa8a44d36dab0ae1cde03d24a3c5b40917b907cc64d9b13",
         intel: "a8d18e497c80033e874ce8031bb33ce77b92261df4d01b6aa0b4c8737de9b8d1"

  arch arm: "arm64", intel: "a8d18e497c80033e874ce8031bb33ce77b92261df4d01b6aa0b4c8737de9b8d1"

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
