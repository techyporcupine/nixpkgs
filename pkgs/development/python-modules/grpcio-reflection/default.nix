{
  lib,
  buildPythonPackage,
  fetchPypi,
  grpcio,
  protobuf,
}:

buildPythonPackage rec {
  pname = "grpcio-reflection";
  version = "1.64.1";
  format = "setuptools";

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-43511hl02iKjtcJgSZKqLyFjlx6jeK2Fa047YyEJ88c=";
  };

  pythonRelaxDeps = [ "grpcio" ];

  propagatedBuildInputs = [
    grpcio
    protobuf
  ];

  pythonImportsCheck = [ "grpc_reflection" ];

  # no tests
  doCheck = false;

  meta = with lib; {
    description = "Standard Protobuf Reflection Service for gRPC";
    homepage = "https://pypi.org/project/grpcio-reflection";
    license = with licenses; [ asl20 ];
    maintainers = with maintainers; [ happysalada ];
  };
}
