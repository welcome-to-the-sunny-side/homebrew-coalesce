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
  
    # ─── Python resources ────────────────────────────────────────────────
    resource "click" do
      url "https://files.pythonhosted.org/packages/96/d3/f04c7bfcf5c1862a2a5b845c6b2b360488cf47af55dfa79c98f6a6bf98b5/click-8.1.7.tar.gz"
      sha256 "ca9853ad459e787e2192211578cc907e7594e294c7ccc834310722b41b9ca6de"
    end
  
    resource "requests" do
      url "https://files.pythonhosted.org/packages/63/70/2bf7780ad2d390a8d301ad0b550f1581eadbd9a20f896afe06353c2a2913/requests-2.32.3.tar.gz"
      sha256 "55365417734eb18255590a9ff9eb97e9e1da868d4ccd6402399eaf68af20a760"
    end
  
    resource "urllib3" do
      url "https://files.pythonhosted.org/packages/7a/50/7fd50a27caa0652cd4caf224aa87741ea41d3265ad13f010886167cfcc79/urllib3-2.2.1.tar.gz"
      sha256 "d0570876c61ab9e520d776c38acbbb5b05a776d3f9ff98a5c8fd5162a444cf19"
    end
  
    resource "tabulate" do
      url "https://files.pythonhosted.org/packages/ec/fe/802052aecb21e3797b8f7902564ab6ea0d60ff8ca23952079064155d1ae1/tabulate-0.9.0.tar.gz"
      sha256 "0095b12bf5966de529c0feb1fa08671671b3368eec77d7ef7ab114be2c068b3c"
    end
  
    # --- NEW: requests’ runtime dependencies ---
    resource "idna" do
      url "https://files.pythonhosted.org/packages/74/72/c3c8847ef8e92ca267a302b44d2ba6fb71b8887ca13459d84769b0836849/idna-3.7.tar.gz"
      sha256 "5ccd8178369920925528a60d22d8f6099d55bc1b5e10b0b6193c0e5e4c911f4e"
    end
  
    resource "charset_normalizer" do
      url "https://files.pythonhosted.org/packages/5d/f3/97bda922191f74443f4fcd8e0635d287cbe6a913e1e365e02df9b836b9b8/charset_normalizer-3.3.2.tar.gz"
      sha256 "97bd88a3e4c0bb2d349251862b2e414ae63c2e33e6351cba2c952cadc2b44260"
    end
    # ────────────────────────────────────────────────────────────────────
  
    def install
      virtualenv_install_with_resources
    end
  
    test do
      assert_match "Usage: coalesce", shell_output("#{bin}/coalesce --help")
    end
  end