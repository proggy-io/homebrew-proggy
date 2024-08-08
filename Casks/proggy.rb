cask "proggy" do
  version "1.8.1"

  if Hardware::CPU.intel?
    arch = "amd64"
    sha256 "59a07e8062f273621baeab07bc57565d0d683d2535df495d8764d5de9827f5c1"
    url "https://github.com/proggy-io/cli/releases/download/v#{version}/proggy-cli_Darwin_x86_64.zip"
  elsif Hardware::CPU.arm?
    arch = "arm64"
    sha256 "e8c934bba36d70acf052abdc82f7ba29d12cd38b1c0127c4d8c598e6278f3d3a"
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
