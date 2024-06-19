{
  lib,
  buildPythonPackage,
  fetchPypi,
  packaging,
  setuptools,
  setuptools-scm,
  sip,
  wheel,
}:

buildPythonPackage rec {
  pname = "pyqt-builder";
  version = "1.16.2";
  format = "pyproject";

  src = fetchPypi {
    pname = "PyQt-builder";
    inherit version;
    hash = "sha256-v3I823zSPSUS4qzae8a4HwD7BczF6aiEa9NNR1FM3bk=";
  };

  nativeBuildInputs = [
    setuptools
    setuptools-scm
    wheel
  ];

  propagatedBuildInputs = [
    packaging
    sip
  ];

  pythonImportsCheck = [ "pyqtbuild" ];

  # There aren't tests
  doCheck = false;

  meta = with lib; {
    description = "PEP 517 compliant build system for PyQt";
    homepage = "https://pypi.org/project/PyQt-builder/";
    license = licenses.gpl3Only;
    maintainers = with maintainers; [ nrdxp ];
  };
}
