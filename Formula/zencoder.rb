class Zencoder < Formula
  desc "AI coding assistant — local-first, multi-provider, auto-routing"
  homepage "https://github.com/divyabairavarasu/zencoder-releases"
  version "16.1.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/divyabairavarasu/zencoder-releases/releases/download/v16.1.0/zencoder_#{version}_darwin_arm64.tar.gz"
      sha256 "9fa2862d4d14409a7460496ec43b10805f3c896281b6649eb4817c7244721ea1"
    else
      url "https://github.com/divyabairavarasu/zencoder-releases/releases/download/v16.1.0/zencoder_#{version}_darwin_amd64.tar.gz"
      sha256 "dc5c11c4fdb48602fc1dc086c4c66f28e15a498e65e841454e14dfb7aac2368b"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/divyabairavarasu/zencoder-releases/releases/download/v16.1.0/zencoder_#{version}_linux_arm64.tar.gz"
      sha256 "b4eb0d4ac45c69544764514b9b355b3d70e3cc9ca9ea3c4053b9111ea628b1a2"
    else
      url "https://github.com/divyabairavarasu/zencoder-releases/releases/download/v16.1.0/zencoder_#{version}_linux_amd64.tar.gz"
      sha256 "df605c7710b02f0b4cf4c31ac14d870fafa613e174d754ea2ffecbe102e0b128"
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
