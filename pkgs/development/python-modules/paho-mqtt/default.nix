{
  lib,
  stdenv,
  buildPythonPackage,
  fetchFromGitHub,
  isPy3k,
  pytestCheckHook,
  mock,
  six,
}:

buildPythonPackage rec {
  pname = "paho-mqtt";
  version = "2.1.0";
  format = "setuptools";

  src = fetchFromGitHub {
    owner = "eclipse";
    repo = "paho.mqtt.python";
    rev = "refs/tags/v${version}";
    hash = "sha256-VMq+WTW+njK34QUUTE6fR2j2OmHxVzR0wrC92zYb1rY=";
  };

  nativeCheckInputs = [
    pytestCheckHook
    six
  ] ++ lib.optionals (!isPy3k) [ mock ];

  doCheck = !stdenv.isDarwin;

  pythonImportsCheck = [ "paho.mqtt" ];

  meta = with lib; {
    description = "MQTT version 3.1.1 client class";
    homepage = "https://eclipse.org/paho";
    license = licenses.epl10;
    maintainers = with maintainers; [
      mog
      dotlambda
    ];
  };
}
