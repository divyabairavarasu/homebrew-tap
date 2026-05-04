class Zencoder < Formula
  desc "AI coding assistant — local-first, multi-provider, auto-routing"
  homepage "https://github.com/divyabairavarasu/zencoder-releases"
  version "16.0.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/divyabairavarasu/zencoder-releases/releases/download/v16.0.0/zencoder_#{version}_darwin_arm64.tar.gz"
      sha256 "a079544c2092e79119e7625bad0201efbf241511bc779487d1b1dd418089df5e"
    else
      url "https://github.com/divyabairavarasu/zencoder-releases/releases/download/v16.0.0/zencoder_#{version}_darwin_amd64.tar.gz"
      sha256 "d2330ec5a056d2334c7fcf7d0d75f424b50659fe3eaabc2126a8cedc22425206"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/divyabairavarasu/zencoder-releases/releases/download/v16.0.0/zencoder_#{version}_linux_arm64.tar.gz"
      sha256 "9a5ef04c9802f4b530da412e0eac4b2229ebc9bbc6aea19220b573cafd72ae5a"
    else
      url "https://github.com/divyabairavarasu/zencoder-releases/releases/download/v16.0.0/zencoder_#{version}_linux_amd64.tar.gz"
      sha256 "27003955cdfe01d2d7ec6235807a5671eb056b77e2aef6d6d0299a68d863ddd9"
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
