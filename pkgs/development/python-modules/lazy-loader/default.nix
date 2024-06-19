{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  flit-core,
  pytestCheckHook,
}:

buildPythonPackage rec {
  pname = "lazy-loader";
  version = "0.4";
  format = "pyproject";

  src = fetchFromGitHub {
    owner = "scientific-python";
    repo = "lazy_loader";
    rev = "refs/tags/v${version}";
    hash = "sha256-4Kid6yhm9C2liPoW+NlCsOiBZvv6iYt7hDunARc4PRY=";
  };

  nativeBuildInputs = [ flit-core ];

  nativeCheckInputs = [ pytestCheckHook ];

  meta = with lib; {
    description = "Populate library namespace without incurring immediate import costs";
    homepage = "https://github.com/scientific-python/lazy_loader";
    changelog = "https://github.com/scientific-python/lazy_loader/releases/tag/v${version}";
    license = licenses.bsd3;
    maintainers = with maintainers; [ ];
  };
}
