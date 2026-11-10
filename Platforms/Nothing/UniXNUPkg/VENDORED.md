# Vendored UniXNUPkg

This directory is a copy of `package/UniXNUPkg` from the UniXNU framework,
taken at commit `40d21cc65171c3a24faa130a2a8e899f85790485`
(<https://github.com/UniXNU/UniXNU>).

`Platforms/Nothing/pongPkg/pong.dsc` and `pong.fdf` reference this package by
name, so the Pong platform can only be built when it is reachable through
`PACKAGES_PATH`. Upstream keeps it inside the framework repository rather than
in a standalone repository, and it is not one of this repository's submodules,
so it has to be vendored here for the checkout to build on its own.

Keep the copy in sync with the framework commit above; do not edit it in place.

License: BSD-2-Clause-Patent, Copyright (c) 2026, UniXNU contributors.
