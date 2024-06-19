{
  lib,
  buildPythonPackage,
  fetchPypi,
  aiohttp,
  pycryptodome,
  xmltodict,
}:

buildPythonPackage rec {
  pname = "panasonic-viera";
  version = "0.4.2";

  format = "setuptools";

  src = fetchPypi {
    pname = "panasonic_viera";
    inherit version;
    sha256 = "sha256-gcFAFwEdCqiC1yHIA2B/gzmwvRwMC9fDxkgCbzIOpjM=";
  };

  propagatedBuildInputs = [
    aiohttp
    pycryptodome
    xmltodict
  ];

  # upstream has no tests
  doCheck = false;

  pythonImportsCheck = [ "panasonic_viera" ];

  meta = {
    description = "Library to control Panasonic Viera TVs";
    homepage = "https://github.com/florianholzapfel/panasonic-viera";
    license = lib.licenses.mit;
    maintainers = with lib.maintainers; [ dotlambda ];
  };
}
