cask "proggy" do
  version "1.6.2"

  if Hardware::CPU.intel?
    arch = "amd64"
    sha256 "db2adcc1aed8bd21f9261ce8d9302135adff3ca15d8c403d8a79f2489ebe28f3"
    url "https://github.com/proggy-io/cli/releases/download/v#{version}/proggy-cli_Darwin_x86_64.zip"
  elsif Hardware::CPU.arm?
    arch = "arm64"
    sha256 "56e6adae21e53017c694762b9679cb2697b5684a28af37374adaaf00454741a9"
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
