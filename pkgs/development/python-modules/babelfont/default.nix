{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  cu2qu,
  defcon,
  fontfeatures,
  fonttools,
  glyphslib,
  openstep-plist,
  orjson,
  poetry-core,
  pytestCheckHook,
  ufolib2,
}:

buildPythonPackage rec {
  pname = "babelfont";
  version = "3.0.5";

  # PyPI source tarballs omit tests, fetch from Github instead
  src = fetchFromGitHub {
    owner = "simoncozens";
    repo = pname;
    rev = "refs/tags/v${version}";
    hash = "sha256-9PEOkkm7qH4ExiJJKrTZX5Ph/urtOyFsy7jjtFepncU=";
  };

  pyproject = true;

  propagatedBuildInputs = [
    cu2qu
    fontfeatures
    fonttools
    glyphslib
    openstep-plist
    orjson
    ufolib2
  ];
  nativeBuildInputs = [ poetry-core ];

  doCheck = true;
  nativeCheckInputs = [
    defcon
    pytestCheckHook
  ];

  meta = with lib; {
    description = "Python library to load, examine, and save fonts in a variety of formats";
    mainProgram = "babelfont";
    homepage = "https://github.com/simoncozens/babelfont";
    license = licenses.bsd3;
    maintainers = with maintainers; [ danc86 ];
  };
}
