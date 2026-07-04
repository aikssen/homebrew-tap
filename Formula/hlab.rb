class Hlab < Formula
  desc "One CLI for your entire homelab — orchestrates Terraform, Ansible and Proxmox"
  homepage "https://hlab.sh"
  version "0.10.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/aikssen/hlab/releases/download/v0.10.0/hlab_darwin_arm64"
      sha256 "d915386cc03ca98190fde2d81c49f543428861ea3184b42b92e30344aa156d6e"
    end
    on_intel do
      url "https://github.com/aikssen/hlab/releases/download/v0.10.0/hlab_darwin_amd64"
      sha256 "47fef63f5601ddaef8b6dabfae68bd8dcfb8b7f2cac9683ffd858af73f0bb676"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/aikssen/hlab/releases/download/v0.10.0/hlab_linux_arm64"
      sha256 "488239d78d1b9303a028622cb6e8e4865d3db4777c923ab45070a045c2f569c7"
    end
    on_intel do
      url "https://github.com/aikssen/hlab/releases/download/v0.10.0/hlab_linux_amd64"
      sha256 "81d7fbb144f59eaedb43d9f83ab7d0685e507cf67b872c83bb87b0309137b73a"
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
