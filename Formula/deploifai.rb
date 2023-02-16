class Deploifai < Formula
  include Language::Python::Virtualenv

  desc ""
  homepage "https://deploif.ai"
  url "https://github.com/deploifai/cli/archive/v0.3.3.tar.gz"
  head "https://github.com/deploifai/cli.git"
  version "0.3.3"
  sha256 "ba717f33ea8655536b6fd6788b27b5224b21abc0"

  depends_on "python@3.8"

  def install
    virtualenv_install_with_resources
  end
end
