{
  lib,
  fetchPypi,
  buildPythonPackage,
}:

buildPythonPackage rec {
  pname = "conway-polynomials";
  version = "0.10";

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-T2GfZPgaPrFsTibFooT+7sJ6b0qtZHZD55ryiYAa4PM=";
  };

  pythonImportsCheck = [ "conway_polynomials" ];

  meta = with lib; {
    description = "Python interface to Frank Lübeck's Conway polynomial database";
    homepage = "https://github.com/sagemath/conway-polynomials";
    maintainers = teams.sage.members;
    license = licenses.gpl3Plus;
  };
}
