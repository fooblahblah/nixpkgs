{ kde, kdelibs, libksane, stdenv }:

kde {
  buildInputs = [ kdelibs libksane ];

  meta = {
    description = "A KScan plugin that implements the scanning through libksane";
    license = stdenv.lib.licenses.gpl2;
  };
}
