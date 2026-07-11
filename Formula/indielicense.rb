# Homebrew formula for IndieLicense.
#
# `Tools/release.sh` fills the version/hash placeholders and publishes the
# result to github.com/tarasowski/homebrew-tap. Users then install with:
#
#   brew install tarasowski/tap/indielicense
#
class Indielicense < Formula
  desc "Offline license keys for indie Mac apps. No server, ever"
  homepage "https://github.com/tarasowski/indielicence"
  url "https://github.com/tarasowski/indielicence/releases/download/v1.0.1/indielicense-v1.0.1-macos-universal.tar.gz"
  sha256 "29751d80116c6453882fc3b1123a4586e2181768f4a996b254f590eb84fee906"
  license "MIT"

  depends_on :macos

  def install
    bin.install "indielicense"
  end

  test do
    assert_match "indielicense", shell_output("#{bin}/indielicense --help")
    chmod 0700, testpath
    system bin/"indielicense", "init", "--product", "brewtest", "--key-dir", testpath
    assert_path_exists testpath/"brewtest.private"
  end
end
