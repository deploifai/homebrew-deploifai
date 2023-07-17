# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class Deploifai < Formula
  desc "CLI tool for Deploifai"
  homepage "https://deploif.ai"
  version "0.5.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/deploifai/cli-go/releases/download/v0.5.1/deploifai_Darwin_x86_64.tar.gz"
      sha256 "8d3db419f1e08c1a6068f424df19cc10ce0d039bb1d288f4fc0601e89ddfe26f"

      def install
        bin.install "deploifai"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/deploifai/cli-go/releases/download/v0.5.1/deploifai_Darwin_arm64.tar.gz"
      sha256 "207f117636fa7779a867904eb2bbb3b23014006a7b0866d9c6eb55a8e910183d"

      def install
        bin.install "deploifai"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/deploifai/cli-go/releases/download/v0.5.1/deploifai_Linux_arm64.tar.gz"
      sha256 "dee552053e360649f5f4d73bcd58dbb87350ada4e39688a240f64aecfc9658ee"

      def install
        bin.install "deploifai"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/deploifai/cli-go/releases/download/v0.5.1/deploifai_Linux_x86_64.tar.gz"
      sha256 "83c8edcc0568bd0810f9a15ff9332a3b30411726cc2b6a7f3aa120f0df1daac1"

      def install
        bin.install "deploifai"
      end
    end
  end

  test do
    system "#{bin}/deploifai", "version"
  end
end
