{ fetchFromGitHub
, buildDotnetModule
, lib
, pkgs
}:

buildDotnetModule rec {
  pname = "Repackinator";
  version = "1.5.2";

  src = fetchFromGitHub {
    owner = "Team-Resurgent";
    repo = pname;
    rev = "V${version}";
    sha256 = "sha256-OyUxwQXIt2aEamEkINH1abRGsi090wNuPz9qQj8VMEI=";
  };

  nativeBuildInputs = [ pkgs.dotnet-sdk pkgs.nuget ];

  projectFile = "Repackinator/Repackinator.csproj";

  meta = with lib; {
    homepage = "some_homepage";
    description = "some_description";
    license = licenses.mit;
  };
}

