class Safeagent < Formula
  desc "Safe Agent CLI and server (agentd) — local-first AI coding assistant"
  homepage "https://github.com/divyabairavarasu/homebrew-tap"
  version "7.2.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/divyabairavarasu/homebrew-tap/releases/download/v7.2.0/safeagent_7.2.0_darwin_arm64.tar.gz"
      sha256 "c385e07b96faa3a2fba6c721aa7a819c7fb9861ab6fbdff928189bc76da27078"
    else
      url "https://github.com/divyabairavarasu/homebrew-tap/releases/download/v7.2.0/safeagent_7.2.0_darwin_amd64.tar.gz"
      sha256 "eda463c10793b4d43669a98bc2d8841f2a8d7fbc6978ea4a20fce698ffdbaa97"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/divyabairavarasu/homebrew-tap/releases/download/v7.2.0/safeagent_7.2.0_linux_arm64.tar.gz"
      sha256 "97be266561eade444c19bbb7acd548b0b515e8f872200913b996ff1c7bbe6ee6"
    else
      url "https://github.com/divyabairavarasu/homebrew-tap/releases/download/v7.2.0/safeagent_7.2.0_linux_amd64.tar.gz"
      sha256 "76c18725ace1560553f1ae319b2f443c6f6761000c5f157260709a8cddca447d"
    end
  end

  def install
    bin.install "safeagent"
    bin.install "agentd"
  end

  service do
    run [opt_bin/"agentd"]
    keep_alive true
    working_dir var
    log_path var/"log/safeagent.log"
    error_log_path var/"log/safeagent.err.log"
  end

  test do
    system "#{bin}/safeagent", "version"
  end
end
