{
  lib,
  async-timeout,
  buildPythonPackage,
  cryptography,
  fetchFromGitHub,
  http-ece,
  poetry-core,
  protobuf,
  pytest-asyncio,
  pytest-mock,
  pytestCheckHook,
  pythonOlder,
  requests,
  requests-mock,
  sphinx,
  sphinx-autodoc-typehints,
  sphinx-rtd-theme,
  sphinxHook,
}:

buildPythonPackage rec {
  pname = "firebase-messaging";
  version = "0.3.0";
  pyproject = true;

  disabled = pythonOlder "3.8";

  src = fetchFromGitHub {
    owner = "sdb9696";
    repo = "firebase-messaging";
    rev = "refs/tags/${version}";
    hash = "sha256-pZpnekJ11yx3L8l56vZOa4uS+jJMxUkYODgNAqysVeY=";
  };

  outputs = [
    "out"
    "doc"
  ];

  nativeBuildInputs = [
    poetry-core
    sphinxHook
  ] ++ passthru.optional-dependencies.docs;

  propagatedBuildInputs = [
    cryptography
    http-ece
    protobuf
    requests
  ];

  passthru.optional-dependencies = {
    docs = [
      sphinx
      sphinx-autodoc-typehints
      sphinx-rtd-theme
    ];
  };

  pythonImportsCheck = [ "firebase_messaging" ];

  nativeCheckInputs = [
    async-timeout
    requests-mock
    pytest-asyncio
    pytest-mock
    pytestCheckHook
  ];

  meta = with lib; {
    description = "Library to subscribe to GCM/FCM and receive notifications within a python application";
    homepage = "https://github.com/sdb9696/firebase-messaging";
    changelog = "https://github.com/sdb9696/firebase-messaging/releases/tag/${version}";
    license = licenses.mit;
    maintainers = with maintainers; [ ];
  };
}
