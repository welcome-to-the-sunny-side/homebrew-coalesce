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
    # Create a fully isolated virtual environment in libexec/venv
    venv_dir = libexec/"venv"
    virtualenv_create(venv_dir, "python3.11", system_site_packages: false)

    # Change into the build directory (where source is unpacked)
    chdir buildpath do
      # Use the virtualenv's python to run setup.py install
      # This installs the package and dependencies directly into the venv
      system venv_dir/"bin/python", "setup.py", "install"
    end

    # Symlink the executable script from the virtualenv's bin directory
    bin.install_symlink venv_dir/"bin/coalesce"
  end

  test do
    # Test if the help command runs without error and shows expected output
    assert_match "Usage:", shell_output("#{bin}/coalesce --help")
    # Check for a specific command description
    assert_match "Add a Codeforces handle to track", shell_output("#{bin}/coalesce --help")
  end
end