cask "proggy" do
  version "1.3.8"

  if Hardware::CPU.intel?
    arch = "amd64"
    sha256 "b4094e0ff9a1b9d2fb1a166c5b217180c222e00a742bb34d2ca8183e9669da66"
  else
    arch = "arm64"
    sha256 "aeb0a444cd7c744617ea4ee212b12bd53689afac15bdaddcd54c858dc14d11f7"
  end

  platform = "darwin"
  extension = "zip"
  fallback_path = "~/Library/Application Support/proggy/config.yml"

  url "https://github.com/proggy-io/cli/releases/download/v#{version}/proggy-#{platform}-#{arch}.#{extension}"
  name "proggy"
  desc "Proggy CLI Tool"
  homepage "https://proggy.io"

  binary "proggy"

  postflight do
    set_permissions "#{staged_path}/proggy", "0755"
  end

  zap trash: [
    fallback_path
  ]
end
