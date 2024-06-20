cask 'proggy' do
  version 1

  if Hardware::CPU.intel?
    arch = 'amd64'
    sha256 0e830eb2735d24ab7e2509b31cb001e0a5a89f011e09a0c3bc964bc29d13820d
  elsif Hardware::CPU.arm?
    arch = 'arm64'
    sha256 
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
