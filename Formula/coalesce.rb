class Coalesce < Formula
  include Language::Python::Virtualenv

  desc "Track and analyze your Codeforces problem-solving data"
  homepage "https://github.com/welcome-to-the-sunny-side/coalesce"
  url "https://github.com/welcome-to-the-sunny-side/coalesce/archive/refs/tags/v0.1.1.tar.gz"
  sha256 "6d030a5ac9c25121ad073ec6d8ff623a601aeb30784b1555011418dde109c971"
  license "MIT"

  depends_on "python@3.11"

  def install
    # Create a virtual environment in libexec using python 3.11
    venv = virtualenv_create(libexec, "python3.11")
    
    # Install the package from the current directory (staged source) into the venv
    # pip will handle downloading dependencies from PyPI
    venv.pip_install "."
    
    # Manually symlink the executable from the venv's bin to Homebrew's bin
    bin.install_symlink libexec/"bin/coalesce"
  end

  test do
    assert_match "Coalesce - Track and analyze your Codeforces problem-solving data", 
                 shell_output("#{bin}/coalesce --help")
  end
end