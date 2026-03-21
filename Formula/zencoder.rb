class Zencoder < Formula
  desc "AI coding assistant — local-first, multi-provider, auto-routing"
  homepage "https://github.com/divyabairavarasu/zencoder-releases"
  version "10.0.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/divyabairavarasu/zencoder-releases/releases/download/v10.0.0/zencoder_#{version}_darwin_arm64.tar.gz"
      sha256 "91f09cd765b1e80638177a51a8c7cd97960076c5c46adbf361c59efc139d0f1d"
    else
      url "https://github.com/divyabairavarasu/zencoder-releases/releases/download/v10.0.0/zencoder_#{version}_darwin_amd64.tar.gz"
      sha256 "22c7c2fa07d70f5d20d783fc169973bae27ec7ce2f1ef52144a1e9df8b2dcc09"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/divyabairavarasu/zencoder-releases/releases/download/v10.0.0/zencoder_#{version}_linux_arm64.tar.gz"
      sha256 "05b25a783d27a561fbf64b6ae56e7132a5b6807fef4f31b00620432b4cc73cbe"
    else
      url "https://github.com/divyabairavarasu/zencoder-releases/releases/download/v10.0.0/zencoder_#{version}_linux_amd64.tar.gz"
      sha256 "96f7901152e2f7a980496c1177ad48cc6c835440385c0ddbd519e65395ab607b"
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
