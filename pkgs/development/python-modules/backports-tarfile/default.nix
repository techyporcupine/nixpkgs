{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  setuptools,
  setuptools-scm,
  wheel,
  jaraco-test,
  pytestCheckHook,
}:

let self = buildPythonPackage rec {
  pname = "backports-tarfile";
  version = "1.2.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "jaraco";
    repo = "backports.tarfile";
    rev = "v${version}";
    hash = "sha256-X3rkL35aDG+DnIOq0fI7CFoWGNtgLkLjtT9y6+23oto=";
  };

  build-system = [
    setuptools
    setuptools-scm
    wheel
  ];

  doCheck = false;

  nativeCheckInputs = [
    jaraco-test
    pytestCheckHook
  ];

  pythonImportsCheck = [ "tarfile" ];

  passthru.tests.pytest = self.overridePythonAttrs { doCheck = true; };

  meta = with lib; {
    description = "Backport of CPython tarfile module";
    homepage = "https://github.com/jaraco/backports.tarfile";
    license = licenses.mit;
    maintainers = with maintainers; [ ];
  };
};
in self
