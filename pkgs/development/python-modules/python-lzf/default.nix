{
  lib,
  buildPythonPackage,
  fetchPypi,
}:

buildPythonPackage rec {
  version = "0.2.6";
  format = "setuptools";
  pname = "python-lzf";

  src = fetchPypi {
    inherit pname version;
    sha256 = "sha256-R9tcLLNxvcRfYcyj4SFUylp6f7uOGjr45cYtFBKdodA=";
  };

  meta = with lib; {
    description = "liblzf python bindings";
    homepage = "https://github.com/teepark/python-lzf";
    license = licenses.mit;
    platforms = platforms.unix;
  };
}
