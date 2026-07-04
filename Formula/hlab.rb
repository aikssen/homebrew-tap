class Hlab < Formula
  desc "One CLI for your entire homelab — orchestrates Terraform, Ansible and Proxmox"
  homepage "https://hlab.sh"
  version "0.10.1"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/aikssen/hlab/releases/download/v0.10.1/hlab_darwin_arm64"
      sha256 "7e020cec536adbb3afd40ab6f7cd87f424838e3acec8726458868b1b239baa3f"
    end
    on_intel do
      url "https://github.com/aikssen/hlab/releases/download/v0.10.1/hlab_darwin_amd64"
      sha256 "f129403a0f30eed4ef03aad9f1249ac589954c5e978d7430acb4c52616561d0e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/aikssen/hlab/releases/download/v0.10.1/hlab_linux_arm64"
      sha256 "b27b5c65ec22c21418d9287b4806551f93130b548fa3e23b62945027a63fcda2"
    end
    on_intel do
      url "https://github.com/aikssen/hlab/releases/download/v0.10.1/hlab_linux_amd64"
      sha256 "58fc2ae22f886a54e46104365b0dbe5b6bf3e656fa7dd2cdf5040de538cef756"
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
