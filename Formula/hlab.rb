class Hlab < Formula
  desc "One CLI for your entire homelab — orchestrates Terraform, Ansible and Proxmox"
  homepage "https://hlab.sh"
  version "0.9.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/aikssen/hlab/releases/download/v0.9.0/hlab_darwin_arm64"
      sha256 "3a0fe33d2d0761f78a42734d4860cf4694b84683ae60f73525ba8182f0b29021"
    end
    on_intel do
      url "https://github.com/aikssen/hlab/releases/download/v0.9.0/hlab_darwin_amd64"
      sha256 "47ff564f6771de24759c938aa182f9495d3bf886172c2fbe3ed77872fca4a07c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/aikssen/hlab/releases/download/v0.9.0/hlab_linux_arm64"
      sha256 "17d9e8fca34a9dd510d4d3e3dbd2996ea5312f4248ca6f9ef19cdb419a022835"
    end
    on_intel do
      url "https://github.com/aikssen/hlab/releases/download/v0.9.0/hlab_linux_amd64"
      sha256 "5284c6cb462de93d2cb73da0a71e89eb6dda87464c5709ed3191a37b398e4f38"
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
