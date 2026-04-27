class Skillchart < Formula
  desc "Dashboard for Claude Code skills — see context cost and find optimizations"
  homepage "https://github.com/davidbroza/skillchart"
  url "https://github.com/davidbroza/skillchart/archive/refs/tags/v0.3.0.tar.gz"
  sha256 "18ef481f0897bbcfce6ec021dd7c3054439432bd8b98acbfee8bb12f425880a0"
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
