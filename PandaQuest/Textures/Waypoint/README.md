# PandaQuest/Textures/Waypoint

The textures of PandaQuest's waypoints (`Nav/Waypoint.lua`): the Pinpoint label, the chevrons, the
badge and the light beam. They are original work, drawn from formulas and signed distance fields by
`tools/make_waypoint_textures.py` in the PandaQuest portal repository (vem882/pandawow), and they are
part of the addon under its licence, the GNU General Public License v3. Nothing here is taken from
another addon or from the game's own art.

Every texture is white, so the game tints it with `SetVertexColor`. The format is the one the rest of
`Textures/` uses: uncompressed 32-bit BGRA TGA, power-of-two sides.

| File | Size | What it is |
|---|---|---|
| `beam.tga` | 32x128 | a column of light: a bright core in a soft halo, fading out upwards; drawn with `SetBlendMode("ADD")` in the beam colour |
| `diamond.tga` | 64x64 | a filled diamond, the badge's fill (tinted dark) |
| `diamond_ring.tga` | 64x64 | the diamond's rim (tinted gold) |
| `chevron.tga` | 32x32 | a chevron pointing down, with a soft glow; three of them step down towards the NPC |
| `plate.tga` | 128x32 | a soft-edged plate behind the Pinpoint label (tinted black, half transparent), and its gold hairlines |

The quest symbol in the middle of the badge is the addon's own map pin (`Textures/pin_*.tga`).
