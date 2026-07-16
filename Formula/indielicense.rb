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
  url "https://github.com/tarasowski/indielicence/releases/download/v1.2.0/indielicense-v1.2.0-macos-universal.tar.gz"
  sha256 "beab6dc7a9ba452cac43a032f08198055d04159ad177a6cecf7f21e1ee440954"
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
