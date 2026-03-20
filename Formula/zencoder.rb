class Zencoder < Formula
  desc "AI coding assistant — local-first, multi-provider, auto-routing"
  homepage "https://github.com/divyabairavarasu/zencoder-releases"
  version "6.0.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/divyabairavarasu/zencoder-releases/releases/download/v6.0.0/zencoder_#{version}_darwin_arm64.tar.gz"
      sha256 "e3959b38a02c229a221746dd55d7041073878f20c7076306044fb491ec08af49"
    else
      url "https://github.com/divyabairavarasu/zencoder-releases/releases/download/v6.0.0/zencoder_#{version}_darwin_amd64.tar.gz"
      sha256 "74b6576a0c98362cc2a828ebd52f15305eb630206dfdd00c4ef481629b912d9c"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/divyabairavarasu/zencoder-releases/releases/download/v6.0.0/zencoder_#{version}_linux_arm64.tar.gz"
      sha256 "882e507d730ea361787963b42ee90a3ce7c195920c0f9a4f847c10ce45a99b3b"
    else
      url "https://github.com/divyabairavarasu/zencoder-releases/releases/download/v6.0.0/zencoder_#{version}_linux_amd64.tar.gz"
      sha256 "2966a0f8d9475d58a68c856dbc563673272bed25251ed43665a08c8d1d257ca5"
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
