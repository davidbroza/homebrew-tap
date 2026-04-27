class Skillchart < Formula
  desc "Dashboard for Claude Code skills — see context cost and find optimizations"
  homepage "https://github.com/davidbroza/skillchart"
  url "https://github.com/davidbroza/skillchart/archive/refs/tags/v0.3.1.tar.gz"
  sha256 "f13888a33433a183d8658437481bf108c8d724521896351e8f35ae0fc9e41ef4"
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
