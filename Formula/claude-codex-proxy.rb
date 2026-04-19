class ClaudeCodexProxy < Formula
  desc "Local proxy: Claude Code to ChatGPT subscription via Codex Responses API"
  homepage "https://github.com/raine/claude-codex-proxy"
  version "0.0.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/claude-codex-proxy/releases/download/v0.0.1/claude-codex-proxy-darwin-arm64.tar.gz"
      sha256 "5c1266a35a177733892c977335e076e16675519b09bf524309127776f1b320bb"
    else
      url "https://github.com/raine/claude-codex-proxy/releases/download/v0.0.1/claude-codex-proxy-darwin-amd64.tar.gz"
      sha256 "65ea077fcff8d125ca24cbc0785b9e1118e4176f83241806f84a137fb3a28209"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/raine/claude-codex-proxy/releases/download/v0.0.1/claude-codex-proxy-linux-arm64.tar.gz"
      sha256 "aaf537b63871a03d217bd1e72e7d05342119b5d996089a3b4fb700294aa5f87a"
    else
      url "https://github.com/raine/claude-codex-proxy/releases/download/v0.0.1/claude-codex-proxy-linux-amd64.tar.gz"
      sha256 "cc085ffdcd188c6f01ac86a4a34802fae8178909bb92c7c44c93747eafe1d485"
    end
  end

  def install
    bin.install "claude-codex-proxy"
  end

  test do
    assert_match version.to_s, shell_output("\#{bin}/claude-codex-proxy --version")
  end
end
