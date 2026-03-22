class Zencoder < Formula
  desc "AI coding assistant — local-first, multi-provider, auto-routing"
  homepage "https://github.com/divyabairavarasu/zencoder-releases"
  version "12.1.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/divyabairavarasu/zencoder-releases/releases/download/v12.1.0/zencoder_#{version}_darwin_arm64.tar.gz"
      sha256 "aa36f38c4c08a5237093efb3c6e9a613def74a43dea730bce2677ac4088138c1"
    else
      url "https://github.com/divyabairavarasu/zencoder-releases/releases/download/v12.1.0/zencoder_#{version}_darwin_amd64.tar.gz"
      sha256 "3ea8fe3f76c7eba0d7b2a55b187d859938569581fdca9391c2c5d5156b40c4cf"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/divyabairavarasu/zencoder-releases/releases/download/v12.1.0/zencoder_#{version}_linux_arm64.tar.gz"
      sha256 "106c6dd779a47228b4f1a6ba47504ad37cd29cb7171b71c2378817f85fc7dd3b"
    else
      url "https://github.com/divyabairavarasu/zencoder-releases/releases/download/v12.1.0/zencoder_#{version}_linux_amd64.tar.gz"
      sha256 "af7006cc788c07c57342152e19fd043edcc65fd958de3b735f2f51bce77796a5"
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
