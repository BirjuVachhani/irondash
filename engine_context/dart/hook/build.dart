import 'package:code_assets/code_assets.dart';
import 'package:hooks/hooks.dart';

import 'prebuilt.dart';
import 'prebuilt.g.dart';

const library = PrebuiltLibrary(
  package: 'irondash_engine_context',
  assetName: 'irondash_engine_context_native.dart',
  cratePath: 'android/rust',
  libName: 'irondash_engine_context_native',
  repo: 'BirjuVachhani/irondash',
  triples: [
    'aarch64-linux-android',
    'armv7-linux-androideabi',
    'x86_64-linux-android',
  ],
);

void main(List<String> args) async {
  await build(args, (input, output) async {
    if (!input.config.buildCodeAssets ||
        input.config.code.targetOS != OS.android) {
      return;
    }

    await library.run(
      input,
      output,
      crateHash: prebuiltCrateHash,
      sha256s: prebuiltSha256,
    );
  });
}
