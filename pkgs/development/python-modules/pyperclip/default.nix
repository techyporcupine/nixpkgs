{
  lib,
  buildPythonPackage,
  fetchPypi,
  stdenv,
  python,
}:

buildPythonPackage rec {
  version = "1.9.0";
  format = "setuptools";
  pname = "pyperclip";

  src = fetchPypi {
    inherit pname version;
    sha256 = "sha256-t94BQt3IG/xcdQfuoZ2pILkiUrVIuWGGyvlKXiUn0xA=";
  };

  # No such file or directory: 'pbcopy'
  doCheck = !stdenv.isDarwin;

  checkPhase = ''
    ${python.interpreter} tests/test_pyperclip.py
  '';

  pythonImportsCheck = [ "pyperclip" ];

  meta = with lib; {
    homepage = "https://github.com/asweigart/pyperclip";
    license = licenses.bsd3;
    description = "Cross-platform clipboard module";
    maintainers = with maintainers; [ dotlambda ];
  };
}
