class Coalesce < Formula
    include Language::Python::Virtualenv
  
    desc "Track and analyze your Codeforces problem-solving data"
    homepage "https://github.com/welcome-to-the-sunny-side/coalesce"
    url "https://github.com/welcome-to-the-sunny-side/coalesce/archive/refs/tags/v0.1.1.tar.gz"
    sha256 "6d030a5ac9c25121ad073ec6d8ff623a601aeb30784b1555011418dde109c971"
    license "MIT"
  
    depends_on "python@3.9"
  
    resource "click" do
      url "https://files.pythonhosted.org/packages/59/87/84326af34517fca8c58418d148f2403df25303e02736832403587318e9e8/click-8.1.3.tar.gz"
      sha256 "7682dc8afb30297001674575ea00d1814d808d6a36af415a82bd481d37ba7b8e"
    end
  
    resource "urllib3" do
      url "https://files.pythonhosted.org/packages/af/47/b215df9f71b4fdba1025fc05a77db2ad243fa0926755a52c5e71659f4e3c/urllib3-2.0.7.tar.gz"
      sha256 "c97dfde1f7bd43a71c8d2a58e369e9b2bf692d1334ea9f9cae55add7d0dd0f84"
    end
  
    resource "requests" do
      url "https://files.pythonhosted.org/packages/9d/ee/391076f5937f0a8cdf5e53b701ffc91753e87b07d66bae4a09aa671897bf/requests-2.28.2.tar.gz"
      sha256 "98b1b2782e3c6c4904938b84c0eb932721069dfdb9134313beff7c83c2df24bf"
    end
  
    resource "tabulate" do
      url "https://files.pythonhosted.org/packages/7a/53/afac341569b3fd558bf2b5428e925e2eb8753ad9627c1f9188104c6e0c4a/tabulate-0.8.10.tar.gz"
      sha256 "6c57f3f3dd7ac2782770155f3adb2db0b1a269637e42f27599925e64b114f519"
    end
  
    def install
      virtualenv_install_with_resources
    end
  
    test do
      assert_match "Coalesce - Track and analyze your Codeforces problem-solving data", 
                   shell_output("#{bin}/coalesce --help")
    end
  end
  