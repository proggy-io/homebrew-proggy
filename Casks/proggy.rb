cask 'proggy' do
  version File.read(File.join(__dir__, 'version.txt')).strip

  if Hardware::CPU.intel?
    arch = 'amd64'
    sha256 File.read(File.join(__dir__, 'sha256-intel.txt')).strip
  elsif Hardware::CPU.arm?
    arch = 'arm64'
    sha256 File.read(File.join(__dir__, 'sha256-arm.txt')).strip
  else
    raise "Unsupported architecture: #{Hardware::CPU.type}"
  end

  platform = 'darwin'
  extension = 'zip'
  fallback_path = '~/Library/Application Support/proggy/config.yml'

  url "https://github.com/proggy-io/cli/releases/download/v#{version}/proggy-#{platform}-#{arch}.#{extension}"

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
cask 'proggy' do
  version File.read(File.join(__dir__, 'version.txt')).strip

  if Hardware::CPU.intel?
    arch = 'amd64'
    sha256 File.read(File.join(__dir__, 'sha256-intel.txt')).strip
  elsif Hardware::CPU.arm?
    arch = 'arm64'
    sha256 File.read(File.join(__dir__, 'sha256-arm.txt')).strip
  else
    raise "Unsupported architecture: #{Hardware::CPU.type}"
  end

  platform = 'darwin'
  extension = 'zip'
  fallback_path = '~/Library/Application Support/proggy/config.yml'

  url "https://github.com/proggy-io/cli/releases/download/v#{version}/proggy-#{platform}-#{arch}.#{extension}"

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
