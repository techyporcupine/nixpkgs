{
  lib,
  buildPythonPackage,
  fetchPypi,
  flask,
  python3-openid,
  isPy3k,
}:

buildPythonPackage rec {
  pname = "flask-openid";
  version = "1.3.1";
  format = "setuptools";

  src = fetchPypi {
    pname = "Flask-OpenID";
    inherit version;
    sha256 = "sha256-J2KLwKN+ZTCUiCMZPgaNeQNa2Ulth7dAQEQ+xITHZXo=";
  };

  propagatedBuildInputs = [
    flask
    python3-openid
  ];

  # no tests for repo...
  doCheck = false;

  meta = with lib; {
    description = "OpenID support for Flask";
    homepage = "https://pythonhosted.org/Flask-OpenID/";
    license = licenses.bsd3;
    maintainers = [ ];
  };
}
