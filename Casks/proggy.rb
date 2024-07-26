cask "proggy" do
  version "1.5.3"

  if Hardware::CPU.intel?
    arch = "amd64"
    sha256 "8d65bb58f1ad0340563aa74a40449a6478180997a8d0abdb34b31276afab0e7d"
    url "https://github.com/proggy-io/cli/releases/download/v#{version}/proggy-cli_Darwin_x86_64.zip"
  elsif Hardware::CPU.arm?
    arch = "arm64"
    sha256 "a41010648195db12178a1dd33720649a7e683d094c5afa35dac38533a3793fde"
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
