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
  url "https://github.com/tarasowski/indielicence/releases/download/v1.8.0/indielicense-v1.8.0-macos-universal.tar.gz"
  sha256 "3d4f4a4dc32e0f0f8197a02e526517f93567d06625e57f891842d576764a0d53"
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
