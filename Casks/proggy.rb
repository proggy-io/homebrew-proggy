cask "proggy" do
  version "1.3.27"

  if Hardware::CPU.intel?
    arch = "amd64"
    sha256 "653a1f9fd295a9a02c429a2da310511e40cf1f40430c59997e78bd3e17136d6a"
    url "https://github.com/proggy-io/cli/releases/download/v#{version}/proggy-cli_Darwin_x86_64.zip"
  elsif Hardware::CPU.arm?
    arch = "arm64"
    sha256 "d8640a5ecc6bfa9b6045d30e1613b651c2172753e5a3b32552f794f7c34ea393"
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
