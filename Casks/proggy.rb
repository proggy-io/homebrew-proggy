cask 'proggy' do
  version '1.3.7'

  if Hardware::CPU.intel?
    arch = 'amd64'
  elsif Hardware::CPU.arm?
    arch = 'arm64'
  else
    raise "Unsupported architecture: #{Hardware::CPU.type}"
  end

  platform = 'darwin'
  extension = 'zip'
  fallback_path = '~/Library/Application Support/proggy/config.yml'

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
    fallback_path
  ]
end
