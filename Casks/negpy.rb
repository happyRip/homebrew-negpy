cask "negpy" do
  version "0.63.0"
  sha256 arm:   "1f2eca9ae6cf9144c6a13b0d0ed4f081c13a4b2f53a255538f0fd9dd09426a4a",
         intel: "452b1f9746afd02cb3b9b7731bd57fa1e111ec49effab7127a5956b8e9da4f47"

  arch arm: "arm64", intel: "452b1f9746afd02cb3b9b7731bd57fa1e111ec49effab7127a5956b8e9da4f47"

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
