class BuildEssentials < Formula
	desc "IncludeOS build essentials for MacOS"
	homepage "http://includeos.org"
	
	depends_on "python3"
	depends_on "conan"
	depends_on "cmake"
	depends_on "llvm@6"

	def install
		system "conan config install https://github.com/includeos/conan_config.git"
		system "conan remote add includeos-test https://api.bintray.com/conan/includeos/test-packages"
	end
end
