class Coalesce < Formula
  desc "Track and analyze your Codeforces problem-solving data"
  homepage "https://github.com/welcome-to-the-sunny-side/coalesce"
  url "https://github.com/welcome-to-the-sunny-side/coalesce/archive/refs/tags/v0.1.1.tar.gz" # This URL is still needed by brew for audit/source checking
  sha256 "6d030a5ac9c25121ad073ec6d8ff623a601aeb30784b1555011418dde109c971" # This sha256 is still needed by brew
  license "MIT"

  depends_on "pipx"
  depends_on "python" # pipx uses this python

  def install
    # Install coalesce using pipx
    # pipx will install the package and its dependencies in an isolated environment
    # It automatically sources the package from PyPI based on the name
    system "pipx", "install", "coalesce==#{version}"

    # Homebrew requires something to be installed into the cellar prefix.
    # We can link the binary installed by pipx into the formula's bin directory.
    # Find the actual binary path within the pipx environment.
    # This is a bit of a common pattern, but might need adjustment if pipx changes internal structure.
    # A potentially more robust way might involve `pipx list --json` but that's more complex.
    bin.install_symlink Dir[Formula["pipx"].opt_libexec/"bin"/"coalesce"].first
  end

  test do
    # Test the command linked into the Homebrew bin directory
    assert_match "Coalesce - Track and analyze your Codeforces problem-solving data",
                 shell_output("#{bin}/coalesce --help")
  end
end