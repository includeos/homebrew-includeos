class Includeos < Formula
	desc "IncludeOS build essentials for MacOS"
	homepage "http://includeos.org"

	url "file:////dev/null"
	sha256 "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"

	version "0.1.0"
	revision 3
	
	depends_on "python3"
	depends_on "conan"
	depends_on "cmake"
	depends_on "llvm@6"

	def install
		system "mkdir -p \"#{prefix}\""
		system "touch \"#{prefix}\"/dummy"
		# Dependencies needed by vmrunner/boot
		system "pip3 install jsonschema psutil"
	end

	def caveats; <<~EOS
		You also have to install the IncludeOS remote and configuration profiles. 
		
		This can be done automatically by executing the following command:

		conan config install https://github.com/includeos/conan_config.git

		Note that this will overwrite your existing Conan profiles and
		remotes, unless you also set CONAN_USER_HOME to point to an
		unused location (default is ~/.conan).
	EOS
	end
end
