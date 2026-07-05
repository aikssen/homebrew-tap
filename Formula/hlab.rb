class Hlab < Formula
  desc "One CLI for your entire homelab — orchestrates Terraform, Ansible and Proxmox"
  homepage "https://hlab.sh"
  version "0.10.2"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/aikssen/hlab/releases/download/v0.10.2/hlab_darwin_arm64"
      sha256 "99573e4fc71014d73bc2ef231a29cfa366817c2ee540d71d92886bb5eb4a8ad9"
    end
    on_intel do
      url "https://github.com/aikssen/hlab/releases/download/v0.10.2/hlab_darwin_amd64"
      sha256 "15c3491767895c0599cf293f19058a747475f78763c1bd8c4f6937bee44f8486"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/aikssen/hlab/releases/download/v0.10.2/hlab_linux_arm64"
      sha256 "40c4841e6d52d86739d33d05c13ca5178e92a0589755afe3af222e17c8232bb8"
    end
    on_intel do
      url "https://github.com/aikssen/hlab/releases/download/v0.10.2/hlab_linux_amd64"
      sha256 "aca1656245b76db2ce2a1510c6151b015331d3df1cea9b06cb1942d6a2dbfa45"
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
