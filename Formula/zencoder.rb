class Zencoder < Formula
  desc "AI coding assistant — local-first, multi-provider, auto-routing"
  homepage "https://github.com/divyabairavarasu/zencoder-releases"
  version "9.3.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/divyabairavarasu/zencoder-releases/releases/download/v9.3.0/zencoder_#{version}_darwin_arm64.tar.gz"
      sha256 "31fa367a9b3a3f8a2a9a0c0d60e34bcdb67ea25ad07e5b991b4b1b3b40b653b1"
    else
      url "https://github.com/divyabairavarasu/zencoder-releases/releases/download/v9.3.0/zencoder_#{version}_darwin_amd64.tar.gz"
      sha256 "1b28c0e88f739531424703466785a2109431502e325b75c35c17c8b9ffcd0832"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/divyabairavarasu/zencoder-releases/releases/download/v9.3.0/zencoder_#{version}_linux_arm64.tar.gz"
      sha256 "d3be5bcd4d3d4b40ca9540eb77191561902dd2500ac63da882f67237c0d7b131"
    else
      url "https://github.com/divyabairavarasu/zencoder-releases/releases/download/v9.3.0/zencoder_#{version}_linux_amd64.tar.gz"
      sha256 "08f9c26397114b04f825c359071f2f04736ef81527412a223dd1920cd45178f6"
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
