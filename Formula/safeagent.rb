class Safeagent < Formula
  desc "Safe Agent CLI and server (agentd)"
  homepage "https://github.com/divyabairavarasu/safe_agent"
  version "0.1.0-test"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/divyabairavarasu/safe_agent/releases/download/v#{version}/safeagent_#{version}_darwin_arm64.tar.gz"
      sha256 "96fd2669f33cf3012a44a9a25dd5ff3ffbcce989e8df05af200d968050bb72a9"
    else
      url "https://github.com/divyabairavarasu/safe_agent/releases/download/v#{version}/safeagent_#{version}_darwin_amd64.tar.gz"
      sha256 "0d2f482949829de70fd0748675f31d929befcd0414b4035ee55611020208e12f"
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
