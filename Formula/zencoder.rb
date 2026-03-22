class Zencoder < Formula
  desc "AI coding assistant — local-first, multi-provider, auto-routing"
  homepage "https://github.com/divyabairavarasu/zencoder-releases"
  version "13.1.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/divyabairavarasu/zencoder-releases/releases/download/v13.1.0/zencoder_#{version}_darwin_arm64.tar.gz"
      sha256 "1fe054188917107b4d141f21bfa655538d0987fe72b7d215eff0d245cf37d457"
    else
      url "https://github.com/divyabairavarasu/zencoder-releases/releases/download/v13.1.0/zencoder_#{version}_darwin_amd64.tar.gz"
      sha256 "8d2b500114bc8f33e3d6135b112e0f5036dfc5b672059c2de24de2c2246b6ff3"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/divyabairavarasu/zencoder-releases/releases/download/v13.1.0/zencoder_#{version}_linux_arm64.tar.gz"
      sha256 "5b7ef67a91cdb80a12fdaccb3f78a3007e6e386d44001e9f84c2cbd41cde509b"
    else
      url "https://github.com/divyabairavarasu/zencoder-releases/releases/download/v13.1.0/zencoder_#{version}_linux_amd64.tar.gz"
      sha256 "423668f55bbee397e68005f28c3c82b11dc5a29ed77580e914284ed9f64eef1c"
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
