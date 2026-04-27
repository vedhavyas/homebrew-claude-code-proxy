class ClaudeCodeProxy < Formula
  desc "Local proxy: Claude Code to ChatGPT subscription via Codex Responses API (patched fork)"
  homepage "https://github.com/vedhavyas/claude-code-proxy"
  version "0.0.7-fix2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/vedhavyas/claude-code-proxy/releases/download/v0.0.7-fix2/claude-code-proxy-darwin-arm64.tar.gz"
      sha256 "2f621145e2a9160244b3692a5a21ee6e2c568c22e5c317bc9cef990c83e66d98"
    else
      odie "This fork only builds darwin-arm64. Use the upstream raine/claude-code-proxy tap for intel Macs."
    end
  end

  on_linux do
    odie "This fork only builds darwin-arm64. Use the upstream raine/claude-code-proxy tap for Linux."
  end

  def install
    bin.install "claude-code-proxy"
  end

  test do
    assert_match version.to_s.split("-").first, shell_output("#{bin}/claude-code-proxy --version")
  end
end
