{
  lib,
  buildPythonPackage,
  fetchPypi,
  azure-mgmt-common,
  azure-mgmt-core,
  pythonOlder,
}:

buildPythonPackage rec {
  pname = "azure-mgmt-storage";
  version = "21.2.0";
  format = "setuptools";

  disabled = pythonOlder "3.7";

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-KHyYQLAb6TGBnUA9p+1SvWL9B3sFKd1HDm28T+3ksg0=";
  };

  propagatedBuildInputs = [
    azure-mgmt-common
    azure-mgmt-core
  ];

  pythonNamespaces = [ "azure.mgmt" ];

  pythonImportsCheck = [ "azure.mgmt.storage" ];

  # Module has no tests
  doCheck = false;

  meta = with lib; {
    description = "This is the Microsoft Azure Storage Management Client Library";
    homepage = "https://github.com/Azure/azure-sdk-for-python";
    license = licenses.mit;
    maintainers = with maintainers; [
      jonringer
      olcai
      maxwilson
    ];
  };
}
