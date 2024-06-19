{
  stdenv,
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
  bzip2,
  openssl,
}:

buildPythonPackage rec {
  pname = "zeroc-ice";
  version = "3.7.10.1";
  pyproject = true;

  src = fetchPypi {
    inherit version pname;
    hash = "sha256-sGOq/aNg33EfdpRVKbtUFXbyZr5B5dWi3Xf10yDBhmQ=";
  };

  nativeBuildInputs = [ setuptools ];

  buildInputs = [
    bzip2
    openssl
  ];

  pythonImportsCheck = [ "Ice" ];

  meta = with lib; {
    broken = stdenv.isDarwin;
    homepage = "https://zeroc.com/";
    license = licenses.gpl2;
    description = "Comprehensive RPC framework with support for Python, C++, .NET, Java, JavaScript and more";
    mainProgram = "slice2py";
    maintainers = with maintainers; [ abbradar ];
  };
}
