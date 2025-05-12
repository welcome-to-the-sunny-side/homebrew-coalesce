class Coalesce < Formula
    include Language::Python::Virtualenv
  
    desc "manage your solves"
    homepage "https://github.com/welcome-to-the-sunny-side/coalesce"
    url      "https://github.com/welcome-to-the-sunny-side/coalesce/archive/refs/tags/v0.1.2.tar.gz"
    sha256   "050ec3de0ddcbf7137e876e1be629231367d0199239fc5ed99a1777da060cc07"
    license  "MIT"
    version  "0.1.2"
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

    resource "plotext" do
      url "https://files.pythonhosted.org/packages/27/d7/58f5ec766e41f8338f04ec47dbd3465db04fbe2a6107bca5f0670ced253a/plotext-5.2.8.tar.gz"
      sha256 "319a287baabeb8576a711995f973a2eba631c887aa6b0f33ab016f12c50ffebe"
    end

    resource "rich" do
      url "https://files.pythonhosted.org/packages/b3/01/c954e134dc440ab5f96952fe52b4fdc64225530320a910473c1fe270d9aa/rich-13.7.1.tar.gz"
      sha256 "9be308cb1fe2f1f57d67ce99e95af38a1e2bc71ad9813b0e247cf7ffbcc3a432"
    end

    # --- NEW: requests’ runtime dependencies ----------------------------
    resource "idna" do
      url "https://files.pythonhosted.org/packages/21/ed/f86a79a07470cb07819390452f178b3bef1d375f2ec021ecfc709fc7cf07/idna-3.7.tar.gz"
      sha256 "028ff3aadf0609c1fd278d8ea3089299412a7a8b9bd005dd08b9f8285bcb5cfc"  #  [oai_citation:0‡PyPI](https://pypi.org/project/idna/3.7/)
    end
  
    resource "charset_normalizer" do
      url "https://files.pythonhosted.org/packages/63/09/c1bc53dab74b1816a00d8d030de5bf98f724c52c1635e07681d312f20be8/charset-normalizer-3.3.2.tar.gz"
      sha256 "f30c3cb33b24454a82faecaf01b19c18562b1e89558fb6c56de4d9118a032fd5"  #  [oai_citation:1‡PyPI](https://pypi.org/project/charset-normalizer/3.3.2/)
    end
    # ────────────────────────────────────────────────────────────────────
  
    def install
      virtualenv_install_with_resources
    end
  
    test do
      assert_match "Usage: coalesce", shell_output("#{bin}/coalesce --help")
    end
  end