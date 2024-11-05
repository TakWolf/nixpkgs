{
  lib,
  buildPythonPackage,
  fetchPypi,
  pythonOlder,
  pytestCheckHook,
  nix-update-script,
  hatchling,
  pypng,
}:

buildPythonPackage rec {
  pname = "pixel-font-knife";
  version = "0.0.5";
  pyproject = true;

  disabled = pythonOlder "3.10";

  src = fetchPypi {
    pname = "pixel_font_knife";
    inherit version;
    hash = "sha256-1ZhOJcLnkTkHypd8WUj4jKKMF1VjCu/JZzIAwtOV+m8=";
  };

  build-system = [ hatchling ];

  dependencies = [
    pypng
  ];

  nativeCheckInputs = [ pytestCheckHook ];

  pythonImportsCheck = [ "pixel_font_knife" ];

  passthru.updateScript = nix-update-script { };

  meta = {
    homepage = "https://github.com/TakWolf/pixel-font-knife";
    description = "A set of pixel font utilities";
    platforms = lib.platforms.all;
    license = lib.licenses.mit;
    maintainers = with lib.maintainers; [
      TakWolf
      h7x4
    ];
  };
}
