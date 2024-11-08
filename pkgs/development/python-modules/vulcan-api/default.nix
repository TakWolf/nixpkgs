{
  lib,
  aenum,
  aiodns,
  aiohttp,
  buildPythonPackage,
  faust-cchardet,
  fetchFromGitHub,
  pyopenssl,
  pythonOlder,
  pytz,
  related,
  requests,
  uonet-request-signer-hebe,
  yarl,
}:

buildPythonPackage rec {
  pname = "vulcan-api";
  version = "2.4.0";
  format = "setuptools";

  disabled = pythonOlder "3.6";

  src = fetchFromGitHub {
    owner = "kapi2289";
    repo = pname;
    rev = "refs/tags/v${version}";
    hash = "sha256-RtB67Pme/qtKG0T3rzm0OeewNZPg2e3aebL5YnSWWFQ=";
  };

  pythonRemoveDeps = [ "faust-cchardet" ];


  propagatedBuildInputs = [
    aenum
    aiodns
    aiohttp
    faust-cchardet
    pyopenssl
    pytz
    related
    requests
    uonet-request-signer-hebe
    yarl
  ];

  # Project has no tests
  doCheck = false;

  pythonImportsCheck = [ "vulcan" ];

  meta = with lib; {
    description = "Python library for UONET+ e-register API";
    homepage = "https://vulcan-api.readthedocs.io/";
    changelog = "https://github.com/kapi2289/vulcan-api/releases/tag/v${version}";
    license = licenses.mit;
    maintainers = with maintainers; [ fab ];
  };
}
