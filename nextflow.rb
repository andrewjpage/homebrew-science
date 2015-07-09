class Nextflow < Formula
  desc "Data-driven computational pipelines"
  homepage "http://www.nextflow.io/"
  # doi "10.6084/m9.figshare.1254958"
  # tag "bioinformatics"

  version "0.14.3"
  url "http://www.nextflow.io/releases/v0.14.3/nextflow"
  sha256 "c608b263f20a7e9f5b2a4b832d49ad90d1570aa51653c0ec961e088f6bb554d7"

  head "https://github.com/nextflow-io/nextflow.git"

  bottle do
    root_url "https://homebrew.bintray.com/bottles-science"
    cellar :any
    sha256 "b31da359fb7e808ab8a0237ce07b4493890a9590b7e24af4876c8d51fddafd34" => :yosemite
    sha256 "c41f4b0b94a943c4fe789d41267c72acdfb7af8206e916ec39df728f5b5b53bd" => :mavericks
    sha256 "6c23a0920d56198715fa11cd395e19857a3309e9ef87e651e3561945f21329e7" => :mountain_lion
  end

  depends_on :java => "1.7+"

  def install
    bin.install "nextflow"
  end

  def post_install
    system "#{bin}/nextflow", "-download"
  end

  test do
    system "echo \"println 'hello'\" |#{bin}/nextflow -q run - |grep hello"
  end
end
