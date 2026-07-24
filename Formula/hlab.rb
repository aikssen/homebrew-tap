class Hlab < Formula
  desc "One CLI for your entire homelab — orchestrates Terraform, Ansible and Proxmox"
  homepage "https://hlab.sh"
  version "0.10.5"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/aikssen/hlab/releases/download/v0.10.5/hlab_darwin_arm64"
      sha256 "b534002b187ae21a2ea856a9526fbbd5c629799c33de45dd4ac8631f2b995996"
    end
    on_intel do
      url "https://github.com/aikssen/hlab/releases/download/v0.10.5/hlab_darwin_amd64"
      sha256 "b2f8ec02ed160543315e1de1eab99f75a9ace97b04dc8b4a88b6afd70b60b5c8"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/aikssen/hlab/releases/download/v0.10.5/hlab_linux_arm64"
      sha256 "7babf288dca98e32c5d933320843ce0f31a38e70a26504771c2b919091891c79"
    end
    on_intel do
      url "https://github.com/aikssen/hlab/releases/download/v0.10.5/hlab_linux_amd64"
      sha256 "90f76d5fd65d2e5945a48fc2cb0c11bf0519d72abfdf8d2392afef59be72df18"
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
