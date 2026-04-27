class ClaudeCodeProxy < Formula
  desc "Local proxy: Claude Code to ChatGPT subscription via Codex Responses API (patched fork)"
  homepage "https://github.com/vedhavyas/claude-code-proxy"
  version "0.0.7-fix3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/vedhavyas/claude-code-proxy/releases/download/v0.0.7-fix3/claude-code-proxy-darwin-arm64.tar.gz"
      sha256 "70f1274d2701ff0dc1c133fd3d1cd30dd24bfd592a45d69fcd07750c4a8a1e7d"
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
