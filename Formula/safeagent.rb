class Safeagent < Formula
  desc "Safe Agent CLI and server (agentd)"
  homepage "https://github.com/safeagent/safe_agent"
  version "0.0.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/safeagent/safe_agent/releases/download/v#{version}/safeagent_#{version}_darwin_arm64.tar.gz"
      sha256 "REPLACE_WITH_ARM64_SHA256"
    else
      url "https://github.com/safeagent/safe_agent/releases/download/v#{version}/safeagent_#{version}_darwin_amd64.tar.gz"
      sha256 "REPLACE_WITH_AMD64_SHA256"
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
