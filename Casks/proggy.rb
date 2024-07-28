cask "proggy" do
  version "1.5.4"

  if Hardware::CPU.intel?
    arch = "amd64"
    sha256 "22a9281c2c24a72d61b89d2768d562315778b7dd9cbeb78f2bd8f75b4d8d5000"
    url "https://github.com/proggy-io/cli/releases/download/v#{version}/proggy-cli_Darwin_x86_64.zip"
  elsif Hardware::CPU.arm?
    arch = "arm64"
    sha256 "1a071cb1f8bc49bcc1bb7dc0facda83465bf3a18b7d3e2365859fe413fde0e4d"
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
