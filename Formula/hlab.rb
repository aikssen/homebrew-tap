class Hlab < Formula
  desc "One CLI for your entire homelab — orchestrates Terraform, Ansible and Proxmox"
  homepage "https://hlab.sh"
  version "0.10.3"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/aikssen/hlab/releases/download/v0.10.3/hlab_darwin_arm64"
      sha256 "94eba6947ebb7323fe87baf2448f497d2e1c98a39b7bda9e51ba6b4deb0d5769"
    end
    on_intel do
      url "https://github.com/aikssen/hlab/releases/download/v0.10.3/hlab_darwin_amd64"
      sha256 "31de931fe7bb17804940ca605ccf31ead7a55fc74dc8a5045f914f23d22536fe"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/aikssen/hlab/releases/download/v0.10.3/hlab_linux_arm64"
      sha256 "90eebcb948a4b9cd6fa1b67302c82820570647532abd3b7a9b8d56886c9cd94c"
    end
    on_intel do
      url "https://github.com/aikssen/hlab/releases/download/v0.10.3/hlab_linux_amd64"
      sha256 "226ae5174d7ebd849ceb162d5f4af3a4e3e0bc3933510f256cd8040385cbf661"
    end
  end

  def install
    bin.install Dir["hlab_*"].first => "hlab"
  end

  def caveats
    <<~EOS
      hlab orchestrates Terraform (required for `hlab {vm,ct} create`) and Ansible
      (only for `hlab {vm,ct} provision`). Install them separately if you don't have
      them yet:

        brew install ansible
        brew install hashicorp/tap/terraform

      Then configure your Proxmox connection once:

        hlab setup
    EOS
  end

  test do
    assert_match "hlab", shell_output("#{bin}/hlab version")
  end
end
