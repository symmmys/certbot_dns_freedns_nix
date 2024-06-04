{
  lib,
  python312Packages,
  fetchFromGithub,
}:

with python312Packages;

buildPythonPackage rec {
  pname = "certbot_dns_freedns";
  version = "0.2.0";
  pyproject = true;

  disabled = pythonOlder "3.8";

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-iV07AYHWm8IU7kvpXHvw4ZSm0RhXMVJ/zEvEeM5Cy7c=";
  };


  #sourceRoot = "${src.name}/${pname}";

  nativeBuildInputs = [ setuptools beautifulsoup4 ];

  dependencies = with python312Packages; [
    acme
    certbot
    requests
    setuptools # for pkg_resources
    requests
    beautifulsoup4
  ];

  build-system = [
    setuptools-scm
  ];


#  nativeCheckInputs = [
#    pytestCheckHook
#  ];
#
#  pytestFlagsArray = [ "-o cache_dir=$(mktemp -d)" ];

#  makeWrapperArgs = [ "--prefix PATH : ${dialog}/bin" ];

  meta = with lib; {
    homepage = "https://github.com/schleuss/certbot_dns_freedns";
    description = "FreeDNS Authenticator plugin for Certbot";
    platforms = platforms.unix;
    mainProgram = "certbot_dns_freedns";
  };
}
