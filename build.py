#!/usr/bin/env python3

import subprocess
import sys
from pathlib import Path


def main() -> int:
    build_dir = Path("build") / "bin"
    build_dir.mkdir(parents=True, exist_ok=True)

    is_windows = sys.platform == "win32"

    lib_file = "FwCore.dll" if is_windows else "libFwCore.so"
    exe_file = "app.exe" if is_windows else "app.bin"

    # Shared library
    subprocess.run(
        [
            "odin",
            "build",
            "src/fw/core",
            f"-out:{build_dir / lib_file}",
            "-reloc-mode:pic",
            "-build-mode:shared",
        ],
        check=True,
    )

    # Main application
    app_cmd = [
        "odin",
        "build",
        "src/app",
        "-collection:fw=inc/fw",
        f"-out:{build_dir / exe_file}",
        f"-define:BINARY_DIR={build_dir}",
    ]

    if not is_windows:
        app_cmd.append("-extra-linker-flags:-Wl,-rpath,$ORIGIN")

    subprocess.run(app_cmd, check=True)
    return 0


if __name__ == "__main__":
    sys.exit(main())
