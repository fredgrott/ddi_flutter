# Build Variants

![Build Variants](./media/deep-dive-into-flutter.jpg)

Part of Deep Dive Into Flutter, Build Variants demos how to implement a dev-OPS function of using build variants to configure app environment values for debugging, testing, etc.

## Basics

Dart 1.17 and beyond allows the definition of compile-time define-variables and run(compile,-t) targets. Thus, a build variant can be specified via the run(compile) -t target and for any other hidden key stuff we can use the cmd-line DEFINE=value keys.

The dart machinery only requires that there be a main function entry point with the -t target that we specify. Do not forget to have your IDE-launch settings changed, like I demo in this project in the dot-run and he dot-vscode folders.
