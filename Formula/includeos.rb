class Includeos < Formula
	desc "IncludeOS build essentials for MacOS"
	homepage "http://includeos.org"
	url "file:////dev/null"
	sha256 "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"

	version "0.1.0"
	revision 5

	depends_on "llvm@6"
	depends_on "qemu"
	depends_on "cmake"
	depends_on "python"
	depends_on "conan"

	resource "psutil" do
		url "https://files.pythonhosted.org/packages/2f/b8/11ec5006d2ec2998cb68349b8d1317c24c284cf918ecd6729739388e4c56/psutil-5.6.1.tar.gz"
		sha256 "fa0a570e0a30b9dd618bffbece590ae15726b47f9f1eaf7518dfb35f4d7dcd21"
	end
	resource "future" do
		url "https://files.pythonhosted.org/packages/90/52/e20466b85000a181e1e144fd8305caf2cf475e2f9674e797b222f8105f5f/future-0.17.1.tar.gz"
		sha256 "67045236dcfd6816dc439556d009594abf643e5eb48992e36beac09c2ca659b8"
	end
	resource "jsonschema" do
		url "https://files.pythonhosted.org/packages/1f/7f/a020327823b9c405ee6f85ab3053ff171e10801b19cfe55c78bb0b3810e7/jsonschema-3.0.1.tar.gz"
		sha256 "0c0a81564f181de3212efa2d17de1910f8732fa1b71c42266d983cd74304e20d"
	end
	resource "attrs" do
		url "https://files.pythonhosted.org/packages/cc/d9/931a24cc5394f19383fbbe3e1147a0291276afa43a0dc3ed0d6cd9fda813/attrs-19.1.0.tar.gz"
		sha256 "f0b870f674851ecbfbbbd364d6b5cbdff9dcedbc7f3f5e18a6891057f21fe399"
	end
	resource "pyrsistent" do
		url "https://files.pythonhosted.org/packages/8c/46/4e93ab8a379d7efe93f20a0fb8a27bdfe88942cc954ab0210c3164e783e0/pyrsistent-0.14.11.tar.gz"
		sha256 "3ca82748918eb65e2d89f222b702277099aca77e34843c5eb9d52451173970e2"
	end
	resource "six" do
		url "https://files.pythonhosted.org/packages/dd/bf/4138e7bfb757de47d1f4b6994648ec67a51efe58fa907c1e11e350cddfca/six-1.12.0.tar.gz"
		sha256 "d16a0141ec1a18405cd4ce8b4613101da75da0e9a7aec5bdd4fa804d0e0eba73"
	end

	def install
		system "mkdir -p \"#{prefix}\""
		system "touch \"#{prefix}\"/dummy"
		resource("psutil").stage { system "python3", *Language::Python.setup_install_args(prefix)}
		resource("future").stage { system "python3", *Language::Python.setup_install_args(prefix)}
		resource("jsonschema").stage { system "python3", *Language::Python.setup_install_args(prefix)}
		resource("attrs").stage { system "python3", *Language::Python.setup_install_args(prefix)}
		resource("pyrsistent").stage { system "python3", *Language::Python.setup_install_args(prefix)}
		resource("six").stage { system "python3", *Language::Python.setup_install_args(prefix)}
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
