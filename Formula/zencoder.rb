class Zencoder < Formula
  desc "AI coding assistant — local-first, multi-provider, auto-routing"
  homepage "https://github.com/divyabairavarasu/zencoder"
  version "5.0.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/divyabairavarasu/zencoder/releases/download/v5.0.0/zencoder_#{version}_darwin_arm64.tar.gz"
      sha256 "708207912895c4f535f5d0e9ae3bd65114e628384917f82d7b63e3b3e4ed3882"
    else
      url "https://github.com/divyabairavarasu/zencoder/releases/download/v5.0.0/zencoder_#{version}_darwin_amd64.tar.gz"
      sha256 "1a45c821ea10b813ef567fa1829de9c02128dee9f14ef49fee1644f8a1141021"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/divyabairavarasu/zencoder/releases/download/v5.0.0/zencoder_#{version}_linux_arm64.tar.gz"
      sha256 "5be4b0aaa62c5a882b6b346ec71e6a5265583a1231470439082968448355cedc"
    else
      url "https://github.com/divyabairavarasu/zencoder/releases/download/v5.0.0/zencoder_#{version}_linux_amd64.tar.gz"
      sha256 "8ccbdd90e3a3cf009450f642b99d9468fde32a66ec0d705ce518f3a9cad18146"
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
