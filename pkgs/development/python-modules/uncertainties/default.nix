{
  lib,
  buildPythonPackage,
  fetchPypi,
  future,
  numpy,
  pynose,
}:

buildPythonPackage rec {
  pname = "uncertainties";
  version = "3.2.1";
  format = "setuptools";

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-sFQXtYve8jbCDnEfsv7hjk23NIqS7c7AExizKqs0kl4=";
  };

  propagatedBuildInputs = [ future ];
  nativeCheckInputs = [
    pynose
    numpy
  ];

  checkPhase = ''
    nosetests -sve test_1to2
  '';

  meta = with lib; {
    homepage = "https://pythonhosted.org/uncertainties/";
    description = "Transparent calculations with uncertainties on the quantities involved (aka error propagation)";
    maintainers = with maintainers; [ rnhmjoj ];
    license = licenses.bsd3;
  };
}
