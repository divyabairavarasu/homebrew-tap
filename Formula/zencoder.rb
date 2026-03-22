class Zencoder < Formula
  desc "AI coding assistant — local-first, multi-provider, auto-routing"
  homepage "https://github.com/divyabairavarasu/zencoder-releases"
  version "11.0.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/divyabairavarasu/zencoder-releases/releases/download/v11.0.0/zencoder_#{version}_darwin_arm64.tar.gz"
      sha256 "49451f2da33fa804415b2f149250f0984be160371bce30b5950a6c575fd093a6"
    else
      url "https://github.com/divyabairavarasu/zencoder-releases/releases/download/v11.0.0/zencoder_#{version}_darwin_amd64.tar.gz"
      sha256 "c320c8e3b8cf974411c6b7048f1ee13ba8d0725d2f048a7ec2e8c799d66d100c"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/divyabairavarasu/zencoder-releases/releases/download/v11.0.0/zencoder_#{version}_linux_arm64.tar.gz"
      sha256 "e2289fe246bb665ed050aaade8f0d6394d9c1de942dc93881a7d47cbfed87508"
    else
      url "https://github.com/divyabairavarasu/zencoder-releases/releases/download/v11.0.0/zencoder_#{version}_linux_amd64.tar.gz"
      sha256 "ce903a0a4209b030303ac068eb1d7e4f76e79db48d8a0d4479ed4f3eac1ce4af"
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
