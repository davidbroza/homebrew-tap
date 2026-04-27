class Skillchart < Formula
  desc "Dashboard for Claude Code skills — see context cost and find optimizations"
  homepage "https://github.com/davidbroza/skillchart"
  url "https://github.com/davidbroza/skillchart/archive/refs/tags/v0.2.0.tar.gz"
  sha256 "7dd2d7d3342042a79b2baa93880645b3bd3b6b1c53b2e88836d17a63532938a5"
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
