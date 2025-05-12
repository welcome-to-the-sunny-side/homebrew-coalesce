class Coalesce < Formula
    include Language::Python::Virtualenv
  
    desc "Track and analyze your Codeforces problem‑solving data"
    homepage "https://github.com/welcome-to-the-sunny-side/coalesce"
    url      "https://github.com/welcome-to-the-sunny-side/coalesce/archive/refs/tags/v0.1.1.tar.gz"
    sha256   "6d030a5ac9c25121ad073ec6d8ff623a601aeb30784b1555011418dde109c971"
    license  "MIT"
    head     "https://github.com/welcome-to-the-sunny-side/coalesce.git", branch: "main"
  
    depends_on "python@3.12"
  
    # ─── Python resources ────────────────────────────────────────────────
    resource "click" do
      url "https://files.pythonhosted.org/packages/fe/1b/6875585e9222fce0e2de3c02c4bb0b3fae946fea5e6357f9981e4691baf1/click-8.1.7.tar.gz"
      sha256 "d2b5255c7cb68deeb4710a29bd58b756a1743adf26d248f8a056d5d8d39d3b4e"
    end
  
    resource "requests" do
      url "https://files.pythonhosted.org/packages/55/0e/8e1bfb82bbdf9f35c05cfcba4c2f0a148e1a0fb719006a13b847841012d9/requests-2.32.3.tar.gz"
      sha256 "08e026c81ef645dd5bb58b2f9b2585fa1313dcd89e5cd9e39af51ed0b56705ef"
    end
  
    resource "urllib3" do
      url "https://files.pythonhosted.org/packages/df/e0/bff4b6db14f46d78741ff8aef823832a011959bd2a509cc0210533b66659/urllib3-2.2.1.tar.gz"
      sha256 "ade852bc26a8a8c2a09203fd36c7f4ba5f5ab54ff699ad7413a8b6f409c262d4"
    end
  
    resource "tabulate" do
      url "https://files.pythonhosted.org/packages/31/b8/d74315e432d780a525208cda5e7855eecbb512c3a2122b1657bf78490c71/tabulate-0.9.0.tar.gz"
      sha256 "a06dbd165ffd4e131d905f989eaf0da8223790fb70d137e7ebc3091c3b8414cb"
    end
    # ────────────────────────────────────────────────────────────────────
  
    def install
      virtualenv_install_with_resources
    end
  
    test do
      # Basic smoke test: the CLI should respond with the help text
      assert_match "Usage: coalesce", shell_output("#{bin}/coalesce --help", 0)
    end
  end