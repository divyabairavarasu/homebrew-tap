class Zencoder < Formula
  desc "AI coding assistant — local-first, multi-provider, auto-routing"
  homepage "https://github.com/divyabairavarasu/zencoder-releases"
  version "13.4.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/divyabairavarasu/zencoder-releases/releases/download/v13.4.0/zencoder_#{version}_darwin_arm64.tar.gz"
      sha256 "722c5e4618f734e89ff5b74076e38df20a4495539a621030e0f95371b1a622c4"
    else
      url "https://github.com/divyabairavarasu/zencoder-releases/releases/download/v13.4.0/zencoder_#{version}_darwin_amd64.tar.gz"
      sha256 "1f1c758a5a6b34ed7d0065141ce4efe8cf42a62a98e490bccf01881ef9e3d2ff"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/divyabairavarasu/zencoder-releases/releases/download/v13.4.0/zencoder_#{version}_linux_arm64.tar.gz"
      sha256 "6e07019d10da3eed283a199122f64d07fb51410653470986d63974edb32ba490"
    else
      url "https://github.com/divyabairavarasu/zencoder-releases/releases/download/v13.4.0/zencoder_#{version}_linux_amd64.tar.gz"
      sha256 "627ac5b15b3f5e2ebcc5dbb15a7eb20685c93d1375574f81e1cb017c66794f11"
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
