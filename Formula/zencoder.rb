class Zencoder < Formula
  desc "AI coding assistant — local-first, multi-provider, auto-routing"
  homepage "https://github.com/divyabairavarasu/zencoder-releases"
  version "9.1.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/divyabairavarasu/zencoder-releases/releases/download/v9.1.0/zencoder_#{version}_darwin_arm64.tar.gz"
      sha256 "b5704341914b15c4a473027c78f86645d48e3489860cca79d7df97ca113a2a64"
    else
      url "https://github.com/divyabairavarasu/zencoder-releases/releases/download/v9.1.0/zencoder_#{version}_darwin_amd64.tar.gz"
      sha256 "719248c8226cfe35a0d72a24ef2e45230b2763fa9d0b085b680fd01e5a989671"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/divyabairavarasu/zencoder-releases/releases/download/v9.1.0/zencoder_#{version}_linux_arm64.tar.gz"
      sha256 "b551c04161d0af972dadf60eaf60c3342dae73fb423c642fa12db9a25723eb34"
    else
      url "https://github.com/divyabairavarasu/zencoder-releases/releases/download/v9.1.0/zencoder_#{version}_linux_amd64.tar.gz"
      sha256 "b27e0bf1ec6fd50f2d9ebc0f76841a26e030ff3e8f24cfa0aaa7959ac9bfd5ac"
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
