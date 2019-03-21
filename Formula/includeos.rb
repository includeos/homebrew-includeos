class Includeos < Formula
	desc "IncludeOS build essentials for MacOS"
	homepage "http://includeos.org"

	url "file:////dev/null"
	sha256 "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"

	version "0.1.0"
	revision 1
	
	depends_on "python3"
	depends_on "conan"
	depends_on "cmake"
	depends_on "llvm@6"

	def install
		system "mkdir -p \"#{prefix}\""
		system "touch \"#{prefix}\"/dummy"
		system "conan config install https://github.com/includeos/conan_config.git"
		system "conan remote add -f includeos-test https://api.bintray.com/conan/includeos/test-packages"
	end
end
