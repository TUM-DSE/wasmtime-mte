# Cross-Compilation

Since `aarch64-unknown-freebsd` is not a Rust tier-1 target, we use [cross](https://github.com/cross-rs/cross) to cross-compile for it.

We need the latest `cross` binary, as well as a custom docker image.

```shell
git clone https://github.com/cross-rs/cross.git
```

Then, apply the following patch:

```patch
From 49ed9ce2082116ac41f80afef1e7c9390d358cd3 Mon Sep 17 00:00:00 2001
From: Martin Fink <martin@finkmartin.com>
Date: Wed, 21 Feb 2024 17:46:53 +0100
Subject: [PATCH] add link

---
 docker/Dockerfile.aarch64-unknown-freebsd | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/docker/Dockerfile.aarch64-unknown-freebsd b/docker/Dockerfile.aarch64-unknown-freebsd
index 8631717..d03726a 100644
--- a/docker/Dockerfile.aarch64-unknown-freebsd
+++ b/docker/Dockerfile.aarch64-unknown-freebsd
@@ -31,6 +31,8 @@ COPY freebsd-fetch-best-mirror.sh /
 COPY freebsd-setup-packagesite.sh /
 COPY freebsd-install-package.sh /
 
+RUN ln -s $(which gcc) /usr/local/bin/aarch64-unknown-linux-gnu-gcc
+
 ENV CARGO_TARGET_AARCH64_UNKNOWN_FREEBSD_LINKER="$CROSS_TOOLCHAIN_PREFIX"gcc.sh \
     AR_aarch64_unknown_freebsd="$CROSS_TOOLCHAIN_PREFIX"ar \
     CC_aarch64_unknown_freebsd="$CROSS_TOOLCHAIN_PREFIX"gcc \
-- 
2.43.0
```

and run the following (assuming you are running on an AArch64 machine).

```shell
cargo build-docker-image \                                                                                                                                                                                                                                                                                                                                             
    --platform=aarch64-unknown-linux-gnu \
    aarch64-unknown-freebsd \
    --tag local
```

If you're on X86, run:

```shell
cargo build-docker-image \                                                                                                                                                                                                                                                                                                                                             
    aarch64-unknown-freebsd \
    --tag local
```

Then, install the latest version of `cross`:

```shell
cargo install --git https://github.com/cross-rs/cross.git cross 
```

Now, you can cross-compile for `aarch64-unknown-freebsd`:

```shell
rustup override set nightly
cross build --target aarch64-unknown-freebsd --release
```

The built binary can be found in `target/aarch64-unknown-freebsd/release/`.
