class Zencoder < Formula
  desc "AI coding assistant — local-first, multi-provider, auto-routing"
  homepage "https://github.com/divyabairavarasu/zencoder"
  version "4.5.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/divyabairavarasu/zencoder/releases/download/v4.5.0/zencoder_#{version}_darwin_arm64.tar.gz"
      sha256 "d7ec554b42c4bd6f480f0d5c6fbae02380399c1f5fd2b961b80e6da2e7ab6663"
    else
      url "https://github.com/divyabairavarasu/zencoder/releases/download/v4.5.0/zencoder_#{version}_darwin_amd64.tar.gz"
      sha256 "544f846fee7d92cfabf396ddf3d36b5b8fcae1061bd5601c18da987414d1ca8a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/divyabairavarasu/zencoder/releases/download/v4.5.0/zencoder_#{version}_linux_arm64.tar.gz"
      sha256 "c021b7973d9ae4898369fa4d54e6c27ce943eaa14dd68095e1a4c5b7d6076d4b"
    else
      url "https://github.com/divyabairavarasu/zencoder/releases/download/v4.5.0/zencoder_#{version}_linux_amd64.tar.gz"
      sha256 "f9a6f0859c7d891b9eea1194e1d73363a5b674a8b468e93f8149021db1bb74f7"
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
