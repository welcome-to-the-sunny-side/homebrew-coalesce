class Coalesce < Formula
    include Language::Python::Virtualenv
  
    desc "Track and analyze your Codeforces problem‑solving data"
    homepage "https://github.com/welcome-to-the-sunny-side/coalesce"
    url      "https://github.com/welcome-to-the-sunny-side/coalesce/archive/refs/tags/v0.1.1.tar.gz"
    sha256   "6d030a5ac9c25121ad073ec6d8ff623a601aeb30784b1555011418dde109c971"
    license  "MIT"
    version  "0.1.1"
    head     "https://github.com/welcome-to-the-sunny-side/coalesce.git", branch: "main"
  
    depends_on "python@3.12"
  
    # ─── Python resources ────────────────────────────────────────────────
    resource "click" do
      url "https://files.pythonhosted.org/packages/7a/63/b9f5a72612bf57e06039e3b849c1a175a1d979eb7367d915d709fc81cab0/click-8.2.0.tar.gz"
      sha256 "f5452aeddd9988eefa20f90f05ab66f17fce1ee2a36907fd30b05bbb5953814d"  #  [oai_citation:0‡PyPI](https://pypi.org/project/click/)
    end
  
    resource "requests" do
      url "https://files.pythonhosted.org/packages/47/11/b4190e6ad510ce6e9d9544fca479d2bf8a77aca58e9e2555eae0ee5bd44a/requests-2.32.3.tar.gz"
      sha256 "55365417734eb18255590a9ff9eb97e9e1da868d4ccd6402399eaf68af20a760"  #  [oai_citation:1‡PyPI](https://pypi.org/project/requests/)
    end
  
    resource "urllib3" do
      url "https://files.pythonhosted.org/packages/ab/30/b8b841b98a2e6ce2ab753bca0d8521c076d9a071b42eaa3f2df6e9096bf0/urllib3-2.4.0.tar.gz"
      sha256 "414bc6535b787febd7567804cc015fee39daab8ad86268f1310a9250697de466"  #  [oai_citation:2‡PyPI](https://pypi.org/project/urllib3/)
    end
  
    resource "tabulate" do
      url "https://files.pythonhosted.org/packages/6e/4c/71bfbf10b35c32ed6c34404fed7e84d8ed1dc5e681434e086bebce8853d3/tabulate-0.9.0.tar.gz"
      sha256 "0095b12bf5966de529c0feb1fa08671671b3368eec77d7ef7ab114be2c068b3c"  #  [oai_citation:3‡PyPI](https://pypi.org/project/tabulate/)
    end
  
    # ── Requests’ runtime dependencies ──
    resource "idna" do
      url "https://files.pythonhosted.org/packages/bd/88/50fc3a4f6d00144cabc4543a2bc04e12b5f0c55d3ddc9b04f11ca6e2c282/idna-3.10.tar.gz"
      sha256 "12f65c9b470abda6dc35cf8e63cc574b1c52b11df2c86030af0ac09b01b13ea9"  #  [oai_citation:4‡PyPI](https://pypi.org/project/idna/)
    end
  
    resource "charset_normalizer" do
      url "https://files.pythonhosted.org/packages/37/8f/1e127086f7f0e59099b767c3f9ef60d4e1c6e6067fe4f0587f889f4ed133/charset_normalizer-3.4.2.tar.gz"
      sha256 "5baececa9ecba31eff645232d59845c07aa030f0c81ee70184a90d35099a0e63"  #  [oai_citation:5‡PyPI](https://pypi.org/project/charset-normalizer/)
    end
  
    resource "certifi" do
      url "https://files.pythonhosted.org/packages/ff/2e/710511b9e2707f9eb59d0e1e4630400fd48af977e6ba1c9eb884048d5e25/certifi-2025.4.26.tar.gz"
      sha256 "0a816057ea3cdefcef70270d2c515e4506bbc954f417fa5ade2021213bb8f0c6"  #  [oai_citation:6‡PyPI](https://pypi.org/project/certifi/)
    end
    # ────────────────────────────────────────────────────────────────────
  
    def install
      virtualenv_install_with_resources
    end
  
    test do
      # Smoke test: ensure CLI loads without missing‑dependency errors.
      assert_match "Usage: coalesce", shell_output("#{bin}/coalesce --help")
    end
  end