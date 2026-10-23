#!/usr/bin/env python3
"""The round logo of PandaQuest's window: PandaQuest/Textures/logo_round.tga, from panda-quest.svg.

    python3 assets/logo/make_round_logo.py            # writes PandaQuest/Textures/logo_round.tga

panda-quest.svg is the portal's logo (platform/web/static/logo.svg in the portal's repository, byte for
byte). It is drawn at four times the size, clipped to a disc on the logo's own dark blue, ringed in the
addon's gold, and scaled down to 128x128 -- a power of two, as the client wants a texture. Written as an
uncompressed 32-bit BGRA TGA with a bottom-left origin, the format of every other texture in the addon.
Needs cairosvg and Pillow; neither is part of the addon.
"""
from __future__ import annotations

import io
import struct
from pathlib import Path

import cairosvg
from PIL import Image, ImageDraw

HERE = Path(__file__).resolve().parent
SOURCE = HERE / "panda-quest.svg"
TARGET = HERE.parents[1] / "PandaQuest" / "Textures" / "logo_round.tga"

SIZE = 128
WORK = SIZE * 4
NAVY = (0x12, 0x2C, 0x50, 255)
GOLD = (0xFF, 0xCE, 0x1E, 255)
RING = 0.045            # the gold ring, as a fraction of the diameter
LOGO = 0.80             # the logo's square, as a fraction of the diameter


def render() -> Image.Image:
    inner = int(WORK * LOGO)
    png = cairosvg.svg2png(url=str(SOURCE), output_width=inner, output_height=inner)
    logo = Image.open(io.BytesIO(png)).convert("RGBA")
    canvas = Image.new("RGBA", (WORK, WORK), (0, 0, 0, 0))
    disc = Image.new("L", (WORK, WORK), 0)
    ImageDraw.Draw(disc).ellipse((0, 0, WORK - 1, WORK - 1), fill=255)
    base = Image.new("RGBA", (WORK, WORK), GOLD)
    ring = int(WORK * RING)
    inside = Image.new("RGBA", (WORK, WORK), (0, 0, 0, 0))
    ImageDraw.Draw(inside).ellipse((ring, ring, WORK - 1 - ring, WORK - 1 - ring), fill=NAVY)
    offset = (WORK - inner) // 2
    inside.alpha_composite(logo, (offset, offset))
    clip = Image.new("L", (WORK, WORK), 0)
    ImageDraw.Draw(clip).ellipse((ring, ring, WORK - 1 - ring, WORK - 1 - ring), fill=255)
    base.paste(inside, (0, 0), clip)
    canvas.paste(base, (0, 0), disc)
    return canvas.resize((SIZE, SIZE), Image.LANCZOS)


def write_tga(path: Path, image: Image.Image) -> None:
    width, height = image.size
    header = struct.pack("<BBBHHBHHHHBB", 0, 0, 2, 0, 0, 0, 0, 0, width, height, 32, 0x08)
    rows = []
    pixels = image.load()
    for y in range(height - 1, -1, -1):           # bottom-left origin
        row = bytearray()
        for x in range(width):
            r, g, b, a = pixels[x, y]
            row += bytes((b, g, r, a))
        rows.append(bytes(row))
    path.write_bytes(header + b"".join(rows))


def main() -> None:
    write_tga(TARGET, render())
    print(f"wrote {TARGET} ({SIZE}x{SIZE})")


if __name__ == "__main__":
    main()
