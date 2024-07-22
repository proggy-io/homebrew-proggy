cask "proggy" do
  version "1.4.3"

  if Hardware::CPU.intel?
    arch = "amd64"
    sha256 "f3b311fa5ac292928fd3fbd994aa4f2ede54bd6b3073ad80f6cb80d8537f3f56"
    url "https://github.com/proggy-io/cli/releases/download/v#{version}/proggy-cli_Darwin_x86_64.zip"
  elsif Hardware::CPU.arm?
    arch = "arm64"
    sha256 "0e74fc104128f048c5b06b010846d5c3004d062579a2ef38b449cb100e9814a3"
    url "https://github.com/proggy-io/cli/releases/download/v#{version}/proggy-cli_Darwin_arm64.zip"
  else
    raise "Unsupported architecture: #{Hardware::CPU.type}"
  end

  platform = "darwin"
  extension = "zip"
  fallback_path = "~/Library/Application Support/proggy/config.yml"

  name "proggy"
  desc "Proggy CLI Tool"
  homepage "https://proggy.io"

  binary "proggy"

  postflight do
    set_permissions "#{staged_path}/proggy", '0755'
  end

  zap trash: [
    fallback_path
  ]
end
