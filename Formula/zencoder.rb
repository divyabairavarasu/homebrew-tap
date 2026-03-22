class Zencoder < Formula
  desc "AI coding assistant — local-first, multi-provider, auto-routing"
  homepage "https://github.com/divyabairavarasu/zencoder-releases"
  version "12.0.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/divyabairavarasu/zencoder-releases/releases/download/v12.0.0/zencoder_#{version}_darwin_arm64.tar.gz"
      sha256 "f9c24cd73c0e89bc9abb45a4b9fabe2fbd8ba17e72dadfbe736949daec7adeed"
    else
      url "https://github.com/divyabairavarasu/zencoder-releases/releases/download/v12.0.0/zencoder_#{version}_darwin_amd64.tar.gz"
      sha256 "666e01a695b339bba71c7362ca518848f33cfd7daf2cfaf75b5d9897f40e0972"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/divyabairavarasu/zencoder-releases/releases/download/v12.0.0/zencoder_#{version}_linux_arm64.tar.gz"
      sha256 "d8ebd0f539e9a6b6fb500458e24eeafadac91908f0e0fdb86582568fa113f978"
    else
      url "https://github.com/divyabairavarasu/zencoder-releases/releases/download/v12.0.0/zencoder_#{version}_linux_amd64.tar.gz"
      sha256 "4565942d0ae25e6ed175125fdaabbd825604104eff0b0ff3e33b2b8ef45824ad"
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
