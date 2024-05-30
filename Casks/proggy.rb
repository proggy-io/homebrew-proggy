cask 'proggy' do
  version '1.0.0'

  name 'proggy'
  desc 'Proggy CLI Tool'
  homepage 'https://proggy.io'

  binary 'proggy'

  postflight do
    set_permissions '#{staged_path}/proggy', '0755'
  end

  zap trash: '~/.proggy'
end
