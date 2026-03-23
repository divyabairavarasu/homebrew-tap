class Zencoder < Formula
  desc "AI coding assistant — local-first, multi-provider, auto-routing"
  homepage "https://github.com/divyabairavarasu/zencoder-releases"
  version "15.0.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/divyabairavarasu/zencoder-releases/releases/download/v15.0.0/zencoder_#{version}_darwin_arm64.tar.gz"
      sha256 "e764a55eaaa3eebb2ad60894aa8128a9fb9d9d3fc1b5ea4f8d985c6dc9dec255"
    else
      url "https://github.com/divyabairavarasu/zencoder-releases/releases/download/v15.0.0/zencoder_#{version}_darwin_amd64.tar.gz"
      sha256 "83940484ba395670f422cf3921497a213bd3042e98e423f2bf56cac8e718199f"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/divyabairavarasu/zencoder-releases/releases/download/v15.0.0/zencoder_#{version}_linux_arm64.tar.gz"
      sha256 "faf50bbade0195d3b3bcc2562e8bff379505e7f0ade11520c0cee04999ac3712"
    else
      url "https://github.com/divyabairavarasu/zencoder-releases/releases/download/v15.0.0/zencoder_#{version}_linux_amd64.tar.gz"
      sha256 "3e891cac407b3c7be4255824d8469528f01b2fb2c48aa738a4a85c1820ea9e3d"
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
