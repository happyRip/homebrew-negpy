cask "negpy" do
  version "0.61.0"
  sha256 arm:   "b2ba3b1ae3d19b4e6ec03bfb688607b1285d7511c049381d40174a63c569d91e",
         intel: "2f1cd5bd7cb7f910a1d933a5042d555e8f694457ad606e7594fd58b89a222686"

  arch arm: "arm64", intel: "2f1cd5bd7cb7f910a1d933a5042d555e8f694457ad606e7594fd58b89a222686"

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
