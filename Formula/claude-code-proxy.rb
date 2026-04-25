class ClaudeCodeProxy < Formula
  desc "Local proxy: Claude Code to ChatGPT subscription via Codex Responses API (patched fork)"
  homepage "https://github.com/vedhavyas/claude-code-proxy"
  version "0.0.7-fix1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/vedhavyas/claude-code-proxy/releases/download/v0.0.7-fix1/claude-code-proxy-darwin-arm64.tar.gz"
      sha256 "92587c4c24ea7e5cf94aefb5847164129e401120ed15c5845e888d0272e54f98"
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
