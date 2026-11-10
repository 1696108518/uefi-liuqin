# Vendored DarwinBootPkg

This directory is a copy of `drivers/DarwinBoot24/DarwinBootPkg` from the
UniXNU-pong device repository at commit
`876bb91e55edbbd7a95c0359f7419261a33aa285`
(<https://github.com/Chengdong-Yu/UniXNU-pong>).

`Platforms/Nothing/pongPkg/pong.dsc` and `pong.fdf` reference
`DarwinBootPkg/Driver/DarwinBoot.inf` to provide the XNU loader protocol that
`UniXNULib` consumes. The package is not distributed on its own and is not one
of this repository's submodules, so it has to be vendored here for the checkout
to build on its own.

Keep the copy in sync with the device repository commit above; do not edit it
in place. The surrounding `Test/` harness and `README.md` from
`drivers/DarwinBoot24` are not needed for the firmware build and are left out.

License: BSD-2-Clause-Patent, Copyright (c) 2026, DarwinBoot contributors.
