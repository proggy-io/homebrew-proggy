cask 'proggy' do
  version '1.3.7'

  if Hardware::CPU.intel?
    arch = 'amd64'
  elsif Hardware::CPU.arm?
    arch = 'arm64'
  else
    raise "Unsupported architecture: #{Hardware::CPU.type}"
  end

  if OS.mac?
    platform = 'darwin'
    extension = 'zip'
    fallback_path = '~/Library/Application Support/proggy/config.yml'
  elsif OS.linux?
    platform = 'linux'
    extension = 'tgz'
    fallback_path = '~/.config/proggy/config.yml'
  else
    raise "Unsupported platform: #{OS.type}"
  end

  url "https://github.com/proggy-io/cli/releases/download/v#{version}/proggy-#{platform}-#{arch}.#{extension}"
  sha256 'your-sha256-checksum-here' # Replace with the actual SHA256 checksum of your binary

  name 'proggy'
  desc 'Proggy CLI Tool'
  homepage 'https://proggy.io'

  binary 'proggy'

  postflight do
    set_permissions "#{staged_path}/proggy", '0755'
  end

  zap trash: [
    "#{ENV['XDG_CONFIG_HOME']}/proggy/config.yml",
    fallback_path
  ]
end
