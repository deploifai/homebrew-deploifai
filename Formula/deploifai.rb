class Deploifai < Formula

  desc "Deploifai CLI"
  homepage "https://deploif.ai"
  url "https://github.com/deploifai/cli-go/releases/download/v0.5.0-alpha-2/deploifai.tar.gz"
  head "https://github.com/deploifai/cli-go.git"
  sha256 "880f31a34e3cd07b2b1371dc15bede494055bd1a27764f79f7affb2acf64524d"
  version "0.5.0-alpha-1"
  license "MIT"



  def install
    bin.install "deploifai_darwin_arm64"
  end

  test do
    system "#{bin}/deploifai_darwin_arm64", "version"
  end

end
