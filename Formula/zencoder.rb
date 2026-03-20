class Zencoder < Formula
  desc "AI coding assistant — local-first, multi-provider, auto-routing"
  homepage "https://github.com/divyabairavarasu/zencoder-releases"
  version "9.0.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/divyabairavarasu/zencoder-releases/releases/download/v9.0.0/zencoder_#{version}_darwin_arm64.tar.gz"
      sha256 "42c26fa59b71849da4f0e27b43ee5dd6d36617ee315724d4bbbb7bc3e6e11f17"
    else
      url "https://github.com/divyabairavarasu/zencoder-releases/releases/download/v9.0.0/zencoder_#{version}_darwin_amd64.tar.gz"
      sha256 "028034426ffb5bad5487ac4a9c903c1107104956238ae2cd567750e401b90f20"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/divyabairavarasu/zencoder-releases/releases/download/v9.0.0/zencoder_#{version}_linux_arm64.tar.gz"
      sha256 "a80c4808bf1a0d12c649377919c991ba557916ecf725918674ba6be27f32c0a5"
    else
      url "https://github.com/divyabairavarasu/zencoder-releases/releases/download/v9.0.0/zencoder_#{version}_linux_amd64.tar.gz"
      sha256 "6bc89f82f7611708d380c39ccd4a493041e60f9dcdb3ffe701f01972bd783b22"
    end
  end

  def install
    bin.install "zencoder"
    bin.install "zencoderd"
    bin.install "zencoder-secrets"
  end

  service do
    run [opt_bin/"zencoderd"]
    keep_alive true
    working_dir var
    log_path var/"log/zencoder.log"
    error_log_path var/"log/zencoder.err.log"
  end

  test do
    system "#{bin}/zencoder", "version"
  end
end
