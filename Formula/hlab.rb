class Hlab < Formula
  desc "One CLI for your entire homelab — orchestrates Terraform, Ansible and Proxmox"
  homepage "https://hlab.sh"
  version "0.10.4"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/aikssen/hlab/releases/download/v0.10.4/hlab_darwin_arm64"
      sha256 "13e76ef8f19469dfa6432228696e8ae8713bd68949ab91966acf9a682df11746"
    end
    on_intel do
      url "https://github.com/aikssen/hlab/releases/download/v0.10.4/hlab_darwin_amd64"
      sha256 "60cdb8e811817d08a370135accc64c0cb83bd6deda74f52e2750303a80303226"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/aikssen/hlab/releases/download/v0.10.4/hlab_linux_arm64"
      sha256 "f3c9416bba71c5c70b497372f1363d9deab3314514a045a7d95b3f703f431775"
    end
    on_intel do
      url "https://github.com/aikssen/hlab/releases/download/v0.10.4/hlab_linux_amd64"
      sha256 "f0f09075d9575c855fc81a0ce4f7531ed5817b27e91d2f74972668edfabe8eac"
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
