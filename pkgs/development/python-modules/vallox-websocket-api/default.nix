{
  lib,
  aiohttp,
  buildPythonPackage,
  pythonOlder,
  fetchFromGitHub,
  setuptools,
  construct,
  websockets,
  pytest-asyncio,
  pytestCheckHook,
}:

buildPythonPackage rec {
  pname = "vallox-websocket-api";
  version = "5.3.0";
  pyproject = true;

  disabled = pythonOlder "3.9";

  src = fetchFromGitHub {
    owner = "yozik04";
    repo = "vallox_websocket_api";
    tag = version;
    hash = "sha256-jJ+FFDU4w1vdCqErz6ksJDvjFcalSAwaH+G77BNI5/E=";
  };

  nativeBuildInputs = [
    setuptools
  ];

  pythonRelaxDeps = [ "websockets" ];

  propagatedBuildInputs = [
    aiohttp
    construct
    websockets
  ];

  nativeCheckInputs = [
    pytest-asyncio
    pytestCheckHook
  ];

  pythonImportsCheck = [ "vallox_websocket_api" ];

  meta = {
    changelog = "https://github.com/yozik04/vallox_websocket_api/releases/tag/${version}";
    description = "Async API for Vallox ventilation units";
    homepage = "https://github.com/yozik04/vallox_websocket_api";
    license = lib.licenses.lgpl3Only;
    maintainers = with lib.maintainers; [ dotlambda ];
  };
}
