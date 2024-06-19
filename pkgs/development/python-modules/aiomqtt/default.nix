{
  lib,
  anyio,
  buildPythonPackage,
  fetchFromGitHub,
  paho-mqtt,
  poetry-core,
  poetry-dynamic-versioning,
  pytestCheckHook,
  pythonOlder,
  typing-extensions,
}:

buildPythonPackage rec {
  pname = "aiomqtt";
  version = "2.1.0";
  pyproject = true;

  disabled = pythonOlder "3.8";

  src = fetchFromGitHub {
    owner = "sbtinstruments";
    repo = "aiomqtt";
    rev = "refs/tags/v${version}";
    hash = "sha256-adwHtWMGd37ll4+j0L3x/RGY0ZqZZGlVPKa+GXmc8Zo=";
  };

  build-system = [
    poetry-core
    poetry-dynamic-versioning
  ];

  dependencies = [
    paho-mqtt
    typing-extensions
  ];

  nativeCheckInputs = [
    anyio
    pytestCheckHook
  ];

  pythonImportsCheck = [ "aiomqtt" ];

  pytestFlagsArray = [
    "-m"
    "'not network'"
  ];

  meta = with lib; {
    description = "Idiomatic asyncio MQTT client, wrapped around paho-mqtt";
    homepage = "https://github.com/sbtinstruments/aiomqtt";
    changelog = "https://github.com/sbtinstruments/aiomqtt/blob/${src.rev}/CHANGELOG.md";
    license = licenses.bsd3;
    maintainers = with maintainers; [ ];
  };
}
