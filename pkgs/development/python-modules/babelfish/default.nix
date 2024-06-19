{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
}:

buildPythonPackage rec {
  pname = "babelfish";
  version = "0.6.1";
  format = "setuptools";

  src = fetchPypi {
    inherit pname version;
    sha256 = "sha256-3stnpGYIiNSEgKtpmDCYNxdBWNDxqmO+uxwuEaq5eqs=";
  };

  propagatedBuildInputs = [ setuptools ];

  # no tests executed
  doCheck = false;

  pythonImportsCheck = [ "babelfish" ];

  meta = with lib; {
    homepage = "https://pypi.python.org/pypi/babelfish";
    description = "Module to work with countries and languages";
    license = licenses.bsd3;
    maintainers = with maintainers; [ ];
  };
}
