class Skillchart < Formula
  desc "Dashboard for Claude Code skills — see context cost and find optimizations"
  homepage "https://github.com/davidbroza/skillchart"
  url "https://github.com/davidbroza/skillchart/archive/refs/tags/v0.3.1.tar.gz"
  sha256 "e8686dc681880346151631a4129af82cbf594c707538c42e4d32899c56e2cf2e"
  license "MIT"

  uses_from_macos "python", since: :catalina

  def install
    libexec.install "build.py"
    (libexec/"bin").install "bin/skillchart"
    bin.install_symlink libexec/"bin/skillchart"
  end

  test do
    assert_match "name", shell_output("#{bin}/skillchart --json --no-open")
  end
end
