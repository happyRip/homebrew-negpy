cask "negpy" do
  version "0.58.0"
  sha256 arm:   "4e5eb8cbf5c2bf001a423f5bac1659c5b0315cf2d01d5f3f650c660f5dd1b9be",
         intel: "d134ff5a0483f53d5851bc1e3c000bf2605a01236df5cf316c209df46edcd898"

  arch arm: "arm64", intel: "x86_64"

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
