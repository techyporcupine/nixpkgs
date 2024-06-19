{
  lib,
  behave,
  buildPythonPackage,
  fetchPypi,
  lxml,
  mock,
  pyparsing,
  pytestCheckHook,
  pythonOlder,
  setuptools,
  typing-extensions,
}:

buildPythonPackage rec {
  pname = "python-docx";
  version = "1.1.2";
  pyproject = true;

  disabled = pythonOlder "3.7";

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-DPHyLpW5ACrdynlI4W8s16zf1JgEfxlByl0pPbd2Lv0=";
  };

  nativeBuildInputs = [ setuptools ];

  propagatedBuildInputs = [
    lxml
    typing-extensions
  ];

  nativeCheckInputs = [
    behave
    mock
    pyparsing
    pytestCheckHook
  ];

  postCheck = ''
    behave --format progress --stop --tags=-wip
  '';

  pythonImportsCheck = [ "docx" ];

  disabledTests = [
    # https://github.com/python-openxml/python-docx/issues/1302
    "it_accepts_unicode_providing_there_is_no_encoding_declaration"
  ];

  pytestFlagsArray = [
    "-W"
    "ignore::DeprecationWarning"
  ];

  meta = with lib; {
    description = "Create and update Microsoft Word .docx files";
    homepage = "https://python-docx.readthedocs.io/";
    changelog = "https://github.com/python-openxml/python-docx/blob/v${version}/HISTORY.rst";
    license = licenses.mit;
    maintainers = with maintainers; [ alexchapman ];
  };
}
