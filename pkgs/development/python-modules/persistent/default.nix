{
  lib,
  buildPythonPackage,
  cffi,
  fetchPypi,
  zope-interface,
  sphinx,
  manuel,
  pythonOlder,
}:

buildPythonPackage rec {
  pname = "persistent";
  version = "6.0";
  format = "setuptools";

  disabled = pythonOlder "3.7";

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-CDZQwP/ty4gDKJY8KUuVEaArawXkIec3p9Vfnu2I+18=";
  };

  nativeBuildInputs = [
    sphinx
    manuel
  ];

  propagatedBuildInputs = [
    zope-interface
    cffi
  ];

  pythonImportsCheck = [ "persistent" ];

  meta = with lib; {
    description = "Automatic persistence for Python objects";
    homepage = "https://github.com/zopefoundation/persistent/";
    changelog = "https://github.com/zopefoundation/persistent/blob/${version}/CHANGES.rst";
    license = licenses.zpl21;
    maintainers = with maintainers; [ ];
  };
}
