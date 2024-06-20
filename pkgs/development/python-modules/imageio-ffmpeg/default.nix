{
  lib,
  buildPythonPackage,
  fetchPypi,
  substituteAll,
  ffmpeg,
  python,
}:

buildPythonPackage rec {
  pname = "imageio-ffmpeg";
  version = "0.5.1";
  format = "setuptools";

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-Dtepsx9WCwydkpxSkc1DDt65vtPOmkl0gOU23UMmSEw=";
  };

  patches = [
    (substituteAll {
      src = ./ffmpeg-path.patch;
      ffmpeg = "${ffmpeg}/bin/ffmpeg";
    })
  ];

  # https://github.com/imageio/imageio-ffmpeg/issues/59
  postPatch = ''
    sed -i '/setup_requires=\["pip>19"\]/d' setup.py
  '';

  checkPhase = ''
    runHook preCheck

    ${python.interpreter} << EOF
    from imageio_ffmpeg import get_ffmpeg_version
    assert get_ffmpeg_version() == '${ffmpeg.version}'
    EOF

    runHook postCheck
  '';

  pythonImportsCheck = [ "imageio_ffmpeg" ];

  meta = with lib; {
    changelog = "https://github.com/imageio/imageio-ffmpeg/releases/tag/v${version}";
    description = "FFMPEG wrapper for Python";
    homepage = "https://github.com/imageio/imageio-ffmpeg";
    license = licenses.bsd2;
    maintainers = [ maintainers.pmiddend ];
  };
}
