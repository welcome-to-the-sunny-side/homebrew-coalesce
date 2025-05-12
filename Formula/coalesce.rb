# typed: false
# frozen_string_literal: true

# Formula for the Coalesce CLI tool
class Coalesce < Formula
  include Language::Python::Virtualenv

  desc "Track and analyze your Codeforces problem-solving data"
  homepage "https://github.com/welcome-to-the-sunny-side/coalesce"
  url "https://github.com/welcome-to-the-sunny-side/coalesce/archive/refs/tags/v0.1.1.tar.gz"
  sha256 "6d030a5ac9c25121ad073ec6d8ff623a601aeb30784b1555011418dde109c971" 
  license "MIT"
  version "0.1.1"

  depends_on "python@3.11"

  def install
    # Create a fully isolated virtual environment in libexec
    # Note: Using libexec directly instead of libexec/venv for pip_install
    venv = virtualenv_create(libexec, "python3.11", system_site_packages: false)

    # Install the package from the staged source directory (buildpath)
    # venv.pip_install implicitly handles ensuring pip/setuptools are present
    # and installs the package and its dependencies from setup.py
    venv.pip_install buildpath

    # Symlink the executable script from libexec/bin into Homebrew's bin directory
    # pip_install puts the script directly into libexec/bin
    bin.install_symlink libexec/"bin/coalesce"
  end

  test do
    # Test if the help command runs without error and shows expected output
    assert_match "Usage:", shell_output("#{bin}/coalesce --help")
    # Check for a specific command description
    assert_match "Add a Codeforces handle to track", shell_output("#{bin}/coalesce --help")
  end
end