cask "negpy" do
  version "0.65.0"
  sha256 arm:   "dd16e2a1b0c0dd43e7428de15a1d3c66e8408b0ec61d0342a76446cd8b2a42d4",
         intel: "f905653bb9852a6177f3f58af26155d2494131124d10a4e1effea2534c711d39"

  arch arm: "arm64", intel: "f905653bb9852a6177f3f58af26155d2494131124d10a4e1effea2534c711d39"

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
